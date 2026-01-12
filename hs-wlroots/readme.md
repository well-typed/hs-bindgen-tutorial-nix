# Generate bindings for `wlroots` (`backend.h`)

`wlroots` is a large project with several dependencies. Therefore, we split the
library into several components. For each component, we separately generate
bindings. We use external binding specifications to inform higher-level
components of types defined in lower-level components.

Run the test application code with

```console
$ nix run
Detected output with description: X11 output 1
```

In the following, we briefly walk through the binding generation process. If you
want to execute the commands yourself, enter a Nix development shell (`nix
develop` or `direnv allow`).

If you are in a development shell, you can also run the test application code
with `cabal run`.

## Include graphs

Include graphs show the inter-dependencies of C header files. Include graphs are
indispensable tools in the process of generating bindings for larger projects
because they give an overview of the header and, in particular also library
inter-dependencies. For example, the C header `libfoo-higher-level.h` may
include (`#include`) another C header `libfoo-lower-level.h`, which in turn may
include another header `libbar.h` from a different library altogether.

<p align="center">
  <img src="./include-graph-example.png" />
</p>

`hs-bindgen` can _generate include graphs for you_. For example, (the last
option is required to satisfy the C preprocessor)

```bash
hs-bindgen-cli info include-graph "wlr/backend.h" --clang-option -DWLR_USE_UNSTABLE
```

```mermaid
graph TD;
  v0["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/backend.h"]
  v72["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/render/dmabuf.h"]
  v69["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/render/pass.h"]
  v68["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/render/wlr_renderer.h"]
  v71["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/render/wlr_texture.h"]
  v73["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/types/wlr_buffer.h"]
  v56["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/types/wlr_output.h"]
  v74["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/util/addon.h"]
  v70["/nix/store/vxm9x8hynlq20jsm38waw7ji3qprd6rq-wlroots-0.19.2/include/wlroots-0.19/wlr/util/box.h"]
  v0-->|"#include &lt;wlr/types/wlr_output.h&gt;"|v56
  v56-->|"#include &lt;wlr/render/wlr_renderer.h&gt;"|v68
  v68-->|"#include &lt;wlr/render/pass.h&gt;"|v69
  v56-->|"#include &lt;wlr/util/box.h&gt;"|v70
  v68-->|"#include &lt;wlr/util/box.h&gt;"|v70
  v69-->|"#include &lt;wlr/util/box.h&gt;"|v70
  v71-->|"#include &lt;wlr/util/box.h&gt;"|v70
  v68-->|"#include &lt;wlr/render/wlr_texture.h&gt;"|v71
  v71-->|"#include &lt;wlr/render/dmabuf.h&gt;"|v72
  v73-->|"#include &lt;wlr/render/dmabuf.h&gt;"|v72
  v56-->|"#include &lt;wlr/types/wlr_buffer.h&gt;"|v73
  v56-->|"#include &lt;wlr/util/addon.h&gt;"|v74
  v73-->|"#include &lt;wlr/util/addon.h&gt;"|v74
```

We observe:
- The include graph is unwieldy.
- The include graph only shows inter-dependencies of the `wlroots` library, and
not of any other libraries such as `wayland`.

Parse-related `hs-bindgen` flags control which nodes are shown in the include
graph.
- We can add `--parse-all` to include all other library headers, but then the
[include graph is too large](./include-graph-all.mmd) to be of any use to us.
- We can [exclude standard headers by tweaking the parse predicate](./include-graph-no-stdlibs.mmd):

```bash
hs-bindgen-cli info include-graph "wlr/backend.h" --clang-option -DWLR_USE_UNSTABLE \
    --parse-all \
    --parse-except-by-header-path ".*glibc.*" \
    --parse-except-by-header-path ".*clang-wrapper.*"
```

However, even the include graph without standard library headers is large, so we
manually collapsed some nodes (_Wlroots sub-headers_, _Wayland server_, and
_Pixman_):

<p align="center">
  <img src="./include-graph-reduced-edited.png" />
</p>

We can see that `wayland-util.h` is the core header that the Wayland server as
well as `wlr/backend.h` depend on. Also, we see that Pixman is a dependency of
`wlr/backend.h`, but not of the Wayland server.

Please see the [script generating include graphs](./generate-include-graphs) for the exact commands used.

## Bindings

Given the include graph above, we separate binding generation into five
components:
- Wayland utilities (`wayland-util.h`),
- Wayland server (`wayland-server-core.h`) ,
- Pixman (`pixman.h`),
- `wlroots` output type (`wlr/types/wlr_output.h`), and
- `wlroots` backend (`wlr/backend.h`).

We use [_external binding specifications_](https://github.com/well-typed/hs-bindgen/blob/main/manual/LowLevel/Usage/06-BindingSpecifications.md) to inform higher-level components
of the types provided by lower-level libraries. We use `hs-bindgen` to generate
external binding specifications for lower-level components such as
`wayland-util.h` with the `--gen-binding-spec` flag, and use those binding
specifications in higher-level components such as the `wlroots` backend with the
`--external-binding-spec` flag. For details, see the [binding generation
script](./generate-bindings)

```bash
./generate-bindings
```

For example, an excerpt of the external binding specifications which
`hs-bindgen` generated for `wayland-util.h`, and which covers the definition of
`Wl_message` is

```yaml
version:
  hs_bindgen: 0.1.0
  binding_specification: '1.0'
target: x86_64-pc-linux-gnu
hsmodule: Generated.Wayland.Util
ctypes:
- headers: wayland-util.h
  cname: struct wl_message
  hsname: Wl_message
- hsname: Wl_message
  representation:
    record:
      constructor: Wl_message
      fields:
      - wl_message_name
      - wl_message_signature
      - wl_message_types
  instances:
  - Eq
  - Show
  - Storable
```

Higher level modules directly use this information, avoiding incompatible
duplicate definitions of data types. For example, `Wayland.Server.Core` contains

```haskell
...

import qualified Generated.Wayland.Util

...

instance HasCField Wl_protocol_logger_message "wl_protocol_logger_message_message" where
  type CFieldType Wl_protocol_logger_message "wl_protocol_logger_message_message" =
    ConstPtr Wl_message

...
```

This code states that the data type `Wl_ptrotocol_logger_message` contains a
field `wl_protocol_logger_message_message` of type `ConstPtr Wl_message`.

# Application code

TODO: Briefly discuss how we use the generated bindings in application code.

The [application code](./app/Wlroots.hs) briefly creates a `wlroots` backend and prints the
detected output descriptions. Run the application with `cabal run`.

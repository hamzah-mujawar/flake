{ pkgs, lib, config, inputs, ... }: let
  newpkgs = pkgs.appendOverlays
    (with inputs.emacs-overlay.overlays; [
      emacs
      package
    ]);

qmljs-grammar-fixed = pkgs.runCommand "tree-sitter-qmljs-fixed" {} ''
  mkdir -p $out/lib
  cp /nix/store/pssghpcq6mqnbj855g8lmddd0vnwkszs-emacs-packages-deps/lib/libqmljs.so \
     $out/lib/libtree-sitter-qmljs.so
'';

  tree-sitter-parsers = grammars: with grammars; [
    tree-sitter-bash
    tree-sitter-c
    tree-sitter-c-sharp
    tree-sitter-cmake
    tree-sitter-cpp
    tree-sitter-css
    tree-sitter-dot
    tree-sitter-elisp
    tree-sitter-glsl
    tree-sitter-haskell
    tree-sitter-html
    tree-sitter-java
    tree-sitter-javascript
    tree-sitter-json
    tree-sitter-json5
    tree-sitter-kotlin
    tree-sitter-latex
    tree-sitter-llvm
    tree-sitter-lua
    tree-sitter-make
    tree-sitter-markdown
    tree-sitter-markdown-inline
    tree-sitter-nickel
    tree-sitter-nix
    tree-sitter-prisma
    tree-sitter-python
    qmljs-grammar-fixed
    tree-sitter-regex
    tree-sitter-rust
    tree-sitter-scss
    tree-sitter-sql
    tree-sitter-toml
    tree-sitter-tsx
    tree-sitter-typescript
    tree-sitter-vim
    tree-sitter-yaml
    tree-sitter-zig
    ];

   custom-emacs =
    with newpkgs;
    ((emacsPackagesFor (emacs30-pgtk.override { withNativeCompilation = true; })).emacsWithPackages (epkgs: with epkgs; [
      vterm
      inputs.nix-qml-support.packages.${pkgs.stdenv.system}.qml-ts-mode
      (treesit-grammars.with-grammars (grammars: tree-sitter-parsers grammars))
    ]));

  
in {
    options = {
      emacs.enable =
            lib.mkEnableOption "enables emacs";
    };
    config = lib.mkIf config.emacs.enable {
      environment.systemPackages = with pkgs; [
	custom-emacs
      ];

      services.emacs = {
	enable = true;
	package = custom-emacs;
      };
    };
}

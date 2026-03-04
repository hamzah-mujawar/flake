{ pkgs, lib, config, inputs, ... }: let
  newpkgs = pkgs.appendOverlays
    (with inputs.emacs-overlay.overlays; [
      emacs
      package
    ]);

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
    inputs.nix-qml-support.packages.${pkgs.stdenv.system}.tree-sitter-qmljs
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
      aidermacs transient
      avy
      better-jumper
      company
      crux
      cmake-font-lock
      direnv
      editorconfig
      evil
      evil-collection
      evil-goggles
      face-explorer
      flycheck
      frames-only-mode
      fussy
      glsl-mode
      groovy-mode
      haskell-ts-mode
      just-mode
      kotlin-mode
      lsp-mode
      lsp-treemacs
      lsp-ui
      lsp-haskell
      lsp-java
      dap-mode
      magit
      markdown-mode
      nasm-mode
      nix-mode reformatter # required by nix mode
      projectile
      inputs.nix-qml-support.packages.${pkgs.stdenv.system}.qml-ts-mode
      astro-ts-mode
      rainbow-mode
      string-inflection
      (treesit-grammars.with-grammars (grammars: tree-sitter-parsers grammars))
      treemacs
      treemacs-evil
      treemacs-projectile
      treemacs-magit
      undo-tree
      use-package
      vertico
      which-key
      melpaPackages.ws-butler
      minuet
      zig-ts-mode
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

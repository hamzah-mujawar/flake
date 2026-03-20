{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    blocksds-nix = {
      url = "github:pgattic/blocksds-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, blocksds-nix }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ blocksds-nix.overlays.default ];
    };
    blocksds = pkgs.blocksdsNix.blocksdsSlim;
    blocksdsEnv = blocksds.passthru;
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        blocksds
        gnumake
        cmake
        python3
      ];

      WONDERFUL_TOOLCHAIN = blocksdsEnv.WONDERFUL_TOOLCHAIN;
      BLOCKSDS            = blocksdsEnv.BLOCKSDS;
      BLOCKSDSEXT         = blocksdsEnv.BLOCKSDSEXT;
    };
  };
}

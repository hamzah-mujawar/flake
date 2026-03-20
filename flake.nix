{
  description = "Flake flake flake flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    
    home-manager.inputs.nixpkgs.follows =  "nixpkgs";

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-colors.url = "github:misterio77/nix-colors";
    
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    awww.url = "git+https://codeberg.org/LGFae/awww";
    
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-qml-support = {
      url = "git+https://git.outfoxxed.me/outfoxxed/nix-qml-support";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:nix-community/nh";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    blocksds-nix = {
        url = "github:pgattic/blocksds-nix";
        inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, nvf, ... } @ inputs:
    let
        pkgs = import nixpkgs {
            inherit system;
            overlays = [ blocksds-nix.overlays.default ];
        };
        blocksds = pkgs.blocksdsNix.blocksdsSlim;
        blocksdsEnv = blocksds.passthru;
    in 
    {
      nixosConfigurations = {
        cthulhu = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            nvf.nixosModules.default
            ./hosts/cthulhu/configuration.nix
            ./nixosModules
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.pickle = ./hosts/cthulhu/home.nix;

              home-manager.extraSpecialArgs = { inherit inputs; };
            }
          ];
        };
      };
      devShells.${system}.default =
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

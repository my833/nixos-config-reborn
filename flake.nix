{
  description = "My nixos configuration";

  inputs = {
    nixpkgs.url = "https://mirrors.ustc.edu.cn/nix-channels/nixos-26.05/nixexprs.tar.xz";
    nixpkgs-unstable.url = "https://mirrors.ustc.edu.cn/nix-channels/nixos-unstable/nixexprs.tar.xz";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};
      homeStateVersion = "26.05";
      username = "u17";
      hosts = [
        { hostname = "nmachine"; stateVersion = "26.05"; }
      ];

      makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs stateVersion hostname username;
        };

        modules = [
          ./hosts/${hostname}/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit username pkgsUnstable homeStateVersion;
            };
          }
        ];
        specialArgs = {
          inherit pkgsUnstable;
        };
      };
    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${host.hostname}" = makeSystem {
            inherit (host) hostname stateVersion;
          };
        }) {} hosts;
    };
}

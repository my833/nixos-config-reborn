{ config, homeStateVersion, username, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-config-reborn/home/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    nvim = "nvim";
  };
in

{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = homeStateVersion;
  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

}

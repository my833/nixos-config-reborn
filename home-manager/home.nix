{ homeStateVersion, username, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = homeStateVersion;
  };
}

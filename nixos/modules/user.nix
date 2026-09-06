{ pkgs, username, ... }: {
  programs.bash.enable = true;

  users = {
    defaultUserShell = pkgs.bash;
    users.${username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  # services.getty.autologinUser = user;
}

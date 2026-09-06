{ pkgs, ... }: {

  services.displayManager.ly.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    # kdenlive
    # jetbrains.pycharm-professional
    # jre8
    # qemu
    # quickemu
  ];

  # neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  services.interception-tools =
    let
      itools = pkgs.interception-tools;
      itols-caps = pkgs.interception-tools-plugins.caps2esc;
    in
    {
      enable = true;
      plugins = [ itols-caps ];
      udevmonConfig = pkgs.lib.mkDefault ''
        - JOB: "${itools}/bin/intercept -g $DEVNODE | ${itols-caps}/bin/caps2esc | ${itools}/bin/uinput -d $DEVNODE"
          DEVICE:
            EVENTS:
              EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
      '';
    };
}

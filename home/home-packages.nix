{ pkgs, ... }: {

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    # anki
    # code-cursor
    # imv
    mpv
    # obs-studio
    # obsidian
    pavucontrol
    # teams-for-linux
    # telegram-desktop
    # vesktop

    yazi
    # CLI utils
    bc
    # bottom
    brightnessctl
    # cliphist
    # ffmpeg
    # ffmpegthumbnailer
    # git-graph
    # grimblast
    htop
    hyprpicker
    ntfs3g
    # mediainfo
    # microfetch
    playerctl
    ripgrep
    # showmethekey
    # silicon
    # udisks
    # ueberzugpp
    unzip
    # w3m
    wget
    wl-clipboard
    # wtype
    # yt-dlp
    zip
    file

    # Coding stuff
    # openjdk23
    # nodejs
    # python311

    # WM stuff
    # libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    # bemoji
    # nix-prefetch-scripts
  ];

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config-reborn#nmachine";
      vi = "nvim";
    };
    initExtra = ''
      export PS1="[\e[38;5;75m\#@\t\e[0m] \w\n\$ "
    '';
  };
}

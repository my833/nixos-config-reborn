{ pkgs, pkgsUnstable, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgsUnstable.emacs;
  };
}

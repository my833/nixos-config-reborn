{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      lua-language-server
      # python311Packages.python-lsp-server
      # nixd
      vimPlugins.nvim-treesitter-parsers.hyprlang
    ];
  };
}

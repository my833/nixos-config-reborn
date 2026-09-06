{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "fake";
        email = "fake@gmail.com";
      };
      alias = {
        ci = "commit";
        co = "checkout";
        st = "status";
        pl = "pull";
        br = "branch";
      };
      core = {
        editor = "nvim";
      };
    };
  };
}

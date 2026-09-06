{lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    configType = "lua";
    settings = {
      mod = { _var = "SUPER"; };
      config = {
        general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        };
        decoration = { rounding = 5; };
      };
      bind = [
        {
          _args = [
          (lib.generators.mkLuaInline "mod .. \" + Q\"")
          (lib.generators.mkLuaInline "hl.dsp.window.close()")
          { locked = true; }
        ];
        }
        {
          _args = [
            "SUPER + RETURN"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"foot\")")
          ];
        }
      ];
    };
  };
}

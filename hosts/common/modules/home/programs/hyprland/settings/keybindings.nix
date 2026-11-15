{ lib, ... }:

let
  WINDOW_FOCUS = map(direction: {
    _args = [
      (lib.generators.mkLuaInline "mod .. ' + ${direction}'")
      (lib.generators.mkLuaInline "hl.dsp.focus({ direction = '${direction}' })")
    ];
  }) ["up" "down" "left" "right"];

  WINDOW_MOVE = map(direction: {
    _args = [
      (lib.generators.mkLuaInline "mod .. ' + SHIFT + ${direction}'")
      (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = '${direction}' })")
    ];
  }) ["up" "down" "left" "right"];

  WORKSPACE_FOCUS = map(workspaceID: {
    _args = [
      (lib.generators.mkLuaInline "mod .. ' + code:${toString (workspaceID+9)}'")
      (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = ${toString workspaceID} })")
    ];
  }) (lib.range 1 10);

  WORKSPACE_WINDOW_MOVE = map(workspaceID: {
    _args = [
      (lib.generators.mkLuaInline "mod .. ' + SHIFT + code:${toString (workspaceID+9)}'")
      (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = ${toString workspaceID} })")
    ];
  }) (lib.range 1 10);
in

{
  wayland.windowManager.hyprland.settings.mod = {
    _var = "ALT";
  };

  wayland.windowManager.hyprland.settings.bind = [
    # Windows
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + SHIFT + A'")
        (lib.generators.mkLuaInline "hl.dsp.window.close()")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + SHIFT + F'")
        (lib.generators.mkLuaInline "hl.dsp.window.float()")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + F'")
        (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({ mode = 'fullscreen' })")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + mouse:272'")
        (lib.generators.mkLuaInline "hl.dsp.window.drag()")
        { mouse = true; }
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + mouse:273'")
        (lib.generators.mkLuaInline "hl.dsp.window.resize()")
        { mouse = true; }
      ];
    }

    # Workspaces
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + TWOSUPERIOR'")
        (lib.generators.mkLuaInline "hl.dsp.workspace.toggle_special('scratchpad')")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + SHIFT + TWOSUPERIOR'")
        (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 'special:scratchpad', follow = false; })")
      ];
    }

    # Applications
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + SHIFT + RETURN'")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd('foot')")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + D'")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wofi')")
      ];
    }
    {
      _args = [
        "PRINT"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd('hyprshot --clipboard-only --freeze --mode region')")
      ];
    }

    # Misc
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + SHIFT + E'")
        (lib.generators.mkLuaInline "hl.dsp.exit()")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + N'")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd('swaync-client -t -sw')")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline "mod .. ' + SHIFT + N'")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd('swaync-client -d -sw')")
      ];
    }
  ] ++ WINDOW_FOCUS ++ WINDOW_MOVE
    ++ WORKSPACE_FOCUS ++ WORKSPACE_WINDOW_MOVE;
}

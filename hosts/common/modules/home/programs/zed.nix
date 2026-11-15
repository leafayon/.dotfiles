{
  programs.zed-editor = {
    enable = false;

    userSettings = {
      auto_update = false;
      base_keymap = "JetBrains";
      buffer_font_family = "jetbrains-mono";
      disable_ai = true;
      rounded_selection = false;
      ensure_final_newline_on_save = false;
      format_on_save = "off";

      tab_bar = {
         show_nav_history_buttons = false;
         show_tab_bar_buttons = false;
      };

      tabs = {
        file_icons = true;
        git_status = true;
        activate_on_close = "neighbour";
        show_diagnostics = "errors";
      };

      toolbar = {};

      status_bar = {
        active_language_button = true;
        cursor_position_button = true;
        line_endings_button = false;
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };

    extensions = [
      "zed-material-theme"
      "material-design-icons"

      "fish"
      "make"
    ];
  };
}

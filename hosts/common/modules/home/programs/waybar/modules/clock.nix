{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-Clock
  MODULE = {
    "clock" = {
      interval = 1;

      timezone = "Europe/Paris";

      format = "{:L%a %d %b %Y @ %H:%M:%S}";
      tooltip-format = "{calendar}";

      calendar = {
        mode = "year";
        mode-mon-col = 4;

        weeks-pos = "left";

        format = {
          months = "{}";
          days = "{}";
          weeks = "w{}";
          weekdays = "{}";
          today = "{}";
        };
      };
    };
  };

  STYLE = '''';
}
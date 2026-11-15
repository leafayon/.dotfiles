{ config, ... }:

{
  services.displayManager.ly = {
    enable = true;

    #settings = {
      # https://codeberg.org/fairyglade/ly/src/branch/master/res/config.ini

      #lang = "fr";

      #battery_id = "BAT0";

      #bigclock = "en";
      #bigclock_seconds = true;

      #clock = "%a %d %b %Y";

      #numlock = true;

      #corner_top_left = "shutdown,restart,britup,britdown,password battery";
      #corner_top_right = "numlock,capslock";
      #corner_bottom_left = "clock version";
    #};
  };
}
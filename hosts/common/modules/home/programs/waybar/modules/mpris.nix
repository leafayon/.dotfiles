{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-MRPIS
  MODULE = {
    "mpris" = {
      #player = "feishin";
      ignored-players = ["firefox"];

      interval = 1;

      on-click = "playerctl play-pause";
      on-click-middle = "playerctl previous";
      on-click-right = "playerctl next";
      on-scroll-up = "playerctl volume 0.01+";
      on-scroll-down = "playerctl volume 0.01-";

      tooltip = false;

      format = "{status_icon} {artist} ~ {title} <small>[{position}/{length}]</small>";
      status-icons = {
        playing = " ";
        paused = " |";
        stopped = " |";
      };

      artist-len = 20;
      title-len = 30;
      ellipsis = "..";
    };
  };

  STYLE = ''
    #mpris.playing {
      border-color: ${osConfig.theme.colors.active};
    }
    #mpris.paused {
      border-color: ${osConfig.theme.colors.inactive};
    }
    #mpris.stopped {
      border-color: ${osConfig.theme.colors.black};
    }
  '';
}
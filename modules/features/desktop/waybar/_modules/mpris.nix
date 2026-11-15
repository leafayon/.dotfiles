{ config, ... }: {
  module = {
    "mpris" = {
      #player = "feishin";
      #ignored-players = ["firefox"];

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

  style = ''
    #mpris {
      /* Top/Right/Bottom/Left */
      padding: 5px 5px 9px 9px;

      border-right: ${toString config.theme.borderSize}px solid ${config.theme.colors.border};
      border-bottom: ${toString config.theme.borderSize}px solid ${config.theme.colors.border};
      border-bottom-right-radius: ${toString config.theme.borderRadius}px;

      background-color: ${config.theme.colors.background};
      color: ${config.theme.colors.text};
    }

    #mpris.playing {
      border-color: ${config.theme.colors.active};
    }
    #mpris.paused {
      border-color: ${config.theme.colors.inactive};
    }
    #mpris.stopped {
      border-color: ${config.theme.colors.black};
    }
  '';
}
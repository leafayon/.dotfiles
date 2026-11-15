{
  programs.wofi = {
    enable = true;

    settings = {
      show = "drun";

      no_actions = true; # Remove submenus

      use_search_box = false;
      allow_images = true;
      hide_scroll = true;
    };
  };
}

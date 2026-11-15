{
  # https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables
  wayland.windowManager.hyprland.settings.env = [
    # Nvidia
    { _args = ["LIBVA_DRIVER_NAME" "nvidia"]; }
    { _args = ["__GLX_VENDOR_LIBRARY_NAME" "nvidia"]; }
  ];
}
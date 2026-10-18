{
  imports = [
    ./modules

    ./programs
    ./services
  ];

  home = {
    username = "admin";
    homeDirectory = "/home/admin";

    stateVersion = "26.05";
  };
}
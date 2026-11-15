{
  networking = {
    hostName = "leafarch";

    #nameservers = ["192.168.1.17"];

    networkmanager = {
      insertNameservers = ["192.168.1.17"];
    };
  };
}

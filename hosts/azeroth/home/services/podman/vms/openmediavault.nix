{
  lexopod.vms.openmediavault = {
    sysBoot = "debian";
    sysCPU = "4";
    sysRAM = "16G";

    devices = []; #TODO: Add the SAS Card

    caddySupport = true;
    caddyPort = 80;

    networks = [
      "vm:ip=10.20.0.2"
      "proxy:ip=10.10.0.200"
    ];
  };
}

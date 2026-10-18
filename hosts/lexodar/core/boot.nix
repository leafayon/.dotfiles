{
  boot = {
    kernel.sysctl = {
      "net.ipv4.ip_unprivileged_port_start" = 53;
    };

    initrd.availableKernelModules = ["xhci_pci" "ahci" "ohci_pci" "ehci_pci" "pata_atiixp" "usbhid" "usb_storage" "sd_mod"];

    kernelModules = ["kvm-amd"];

    supportedFilesystems = ["zfs"];

    zfs = {
      forceImportRoot = false;
      extraPools = ["stormwind"];
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;

      timeout = 5;
    };
  };
}

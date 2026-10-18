{ config, lib, ... }:

# A B C D E F G H I J K L M N O P Q R S T U V W Y Z

let
  cfg = config.lexopod.vms;
in

{
  options.lexopod.vms = lib.mkOption {
    type = lib.types.attrsOf(lib.types.submodule {
      options = {
        caddyDomainName = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };

        caddyPort = lib.mkOption {
          type = lib.types.int;
        };

        caddySupport = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };

        capabilities = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        devices = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        environments = lib.mkOption {
          type = lib.types.attrsOf lib.types.str; #TODO: Rework the type
          default = {};
        };

        labels = lib.mkOption {
          type = lib.types.attrsOf lib.types.str;
          default = {};
        };

        networks = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        ports = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        volumes = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        sysBoot = lib.mkOption {
          type = lib.types.str;
          default = "";
        };

        sysCPU = lib.mkOption {
          type = lib.types.str;
        };

        sysDiskSize = lib.mkOption {
          type = lib.types.str;
          default = "64G";
        };

        sysRAM = lib.mkOption {
          type = lib.types.str;
        };

        windowsSupport = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };

        windowsVersion = lib.mkOption {
          type = lib.types.str;
        };
      };
    });
  };

  config = {
    services.podman.containers = lib.mapAttrs(name: vm: {
      addCapabilities = builtins.map (cap: "CAP_" + cap) vm.capabilities
       ++ ["NET_ADMIN"];

      devices = vm.devices
        ++ [
          "/dev/kvm"
          "/dev/net/tun"
        ];

      environment = vm.environments
        // {
          TZ = "Europe/Paris";

          CPU_CORES = vm.sysCPU;
          RAM_SIZE = vm.sysRAM;

          DISK_SIZE = vm.sysDiskSize;

          DISPLAY = "vnc";

          WEB = "N";

          BOOT = vm.sysBoot;

          TIMEOUT = "10";

          #USER_PORTS = "22,80,443,8006";
        }
        // lib.optionalAttrs vm.windowsSupport {
          VERSION = vm.windowsVersion;
          KEYBOARD = "fr-FR";
        };

      extraPodmanArgs = [
        "--name=vm_${name}"
        "--hostname=${name}"
      ];

      image = "${if vm.windowsSupport then "dockurr/windows:6.05" else "qemux/qemu:7.50"}";

      labels = vm.labels
        // lib.optionalAttrs vm.caddySupport {
          "caddy_3" = "(vm_${name})";
          "caddy_3.reverse_proxy" = "{{upstreams ${builtins.toString vm.caddyPort}}}";

          "caddy_4" = "*.leafayon.lan";
          "caddy_4.tls" = "internal";
          "caddy_4.@vm_${name}" = "host ${if builtins.isNull vm.caddyDomainName then name else vm.caddyDomainName}.leafayon.lan";
          "caddy_4.handle" = "@vm_${name}";
          "caddy_4.handle.import" = "vm_${name}";
        };

      network = vm.networks;
        #++ ["vm"]
        #++ lib.optionals vm.caddySupport ["proxy"];

      ports = vm.ports
        ++ ["8006:8006"];

      volumes = vm.volumes
        ++ ["vm_${name}-os:/storage"];
    }) cfg;
  };
}

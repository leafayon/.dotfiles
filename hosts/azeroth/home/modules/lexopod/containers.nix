{ config, lib, ... }:

# A B C D E F G H I J K L M N O P Q R S T U V W Y Z

let
  cfg = config.lexopod.containers;
in

{
  options.lexopod.containers = lib.mkOption {
    type = lib.types.attrsOf(lib.types.submodule {
      options = {
        caddyDomainName = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };

        caddyPort = lib.mkOption {
          type = lib.types.int;
        };

        caddyPublicDomainName = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };

        caddyPublicDomainSupport = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };

        caddySupport = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };

        capabilities = lib.mkOption {
          type = lib.types.attrsOf lib.types.bool;
          default = {};
        };

        dependsOn = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        devices = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        vpnSupport = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };

        environments = lib.mkOption {
          type = lib.types.attrsOf lib.types.str; #TODO: Rework the type
          default = {};
        };

        extraEntrypointArguments = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        extraPodmanArguments = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };

        imageName = lib.mkOption {
          type = lib.types.str;
        };

        imageTag = lib.mkOption {
          type = lib.types.str;
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

        secretSupport = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };

        socketSupport = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };

        volumes = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };
      };
    });
  };

  config = {
    services.podman.containers = lib.mapAttrs(name: container: {
      addCapabilities = builtins.map (cap: "CAP_" + cap) container.capabilities;

      devices = container.devices;

      environment = container.environments
        // { TZ = "Europe/Paris"; };

      exec = container.extraEntrypointArguments;

      extraPodmanArgs = container.extraPodmanArguments
        + ["--hostname=${name}"];

      image = "${container.imageName}:${container.imageTag}";

      labels = container.labels
        // lib.optionalAttrs container.caddySupport {
          "caddy_0" = "(${name})";
          "caddy_0.reverse_proxy" = "{{upstreams ${builtins.toString container.caddyServicePort}}}";

          "caddy_1" = "*.leafayon.lan";
          "caddy_1.tls" = "internal";
          "caddy_1.@${name}" = "host ${if builtins.isNull container.caddyDomainName then name else container.caddyDomainName}.leafayon.lan";
          "caddy_1.handle" = "@${name}";
          "caddy_1.handle.import" = name;
        } // lib.optionalAttrs container.caddyPublicDomainSupport {
          "caddy_2" = "*.leafayon.qzz.io leafayon.qzz.io";
          "caddy_2.tls.dns" = "cloudflare {env.CLOUDFLARE_API_TOKEN}";
          "caddy_2.@${name}" = "host ${if builtins.isNull container.caddyPublicDomainName then name else container.caddyPublicDomainName}.leafayon.qzz.io";
          "caddy_2.handle" = "@${name}";
          "caddy_2.handle.import" = name;
        };

      networks = container.networks
        ++ lib.optionals container.vpnSupport ["container:gluetun"];

      ports = container.ports;

      volumes = container.volumes
        ++ lib.optionals container.socketSupport ["/run/user/1000/podman/podman.sock:/var/run/docker.sock:ro"]
        ++ lib.optionals container.secretSupport ["/mnt/stormwind/podman/secrets/${name}:/secrets:ro"]; #TODO: Rework the path
    }) cfg;
  };
}

{
  imports = [
    ./lexopod.nix

    #./medias/autobrr.nix
    #./medias/immich.nix
    ./medias/jellyfin.nix
    ./medias/koito.nix
    ./medias/qbittorrent.nix
    ./medias/seerr.nix
    ./medias/soulsolid.nix

    #../monitoring/glances.nix
    #../monitoring/grafana.nix
    #./monitoring/kuma.nix
    #../monitoring/prometheus.nix

    ./networking/caddy.nix
    ./networking/gluetun.nix
    ./networking/pihole.nix
    ./networking/wgdashboard.nix

    #./services/cypht.nix
    ./services/diun.nix
    ./services/gotify.nix
    ./services/homepage.nix
    ./services/memos.nix
    #./services/protonmail.nix
    ./services/sftp.nix
    ./services/vaultwarden.nix
  ];
}

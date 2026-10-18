let
  containerEnvironments = {
    LOG_LEVEL = "trace";
    LOG_CALLER = "false";

    DIUN_WATCH_WORKERS = "10";
    # Every Wednesday at 14:30
    DIUN_WATCH_SCHEDULE = "30 14 * * 3";
    DIUN_WATCH_JITTER = "30s";
    DIUN_WATCH_RUNONSTARTUP = "true";
    DIUN_WATCH_COMPAREDIGEST = "true";

    # Watch every image tags
    DIUN_DEFAULTS_WATCHREPO = "true";
    DIUN_DEFAULTS_MAXTAGS = "1";
    DIUN_DEFAULTS_SORTTAGS = "reverse";
    #DIUN_DEFAULTS_EXCLUDETAGS = "latest,edge,dev,main,master";

    DIUN_PROVIDERS_DOCKER = "true";
    DIUN_PROVIDERS_DOCKER_WATCHBYDEFAULT = "true";

    DIUN_NOTIF_GOTIFY_ENDPOINT = "http://10.89.0.20";
    DIUN_NOTIF_GOTIFY_TOKENFILE = "/secrets/GOTIFY_TOKEN";
    DIUN_NOTIF_GOTIFY_TIMEOUT = "10s";
    DIUN_NOTIF_GOTIFY_TEMPLATETITLE = "{{ .Entry.Image.Path }}:{{ .Entry.Image.Tag }} released";
    DIUN_NOTIF_GOTIFY_TEMPLATEBODY = "A new tag for {{ if .Entry.Image.HubLink }} [{{ .Entry.Image }}]({{ .Entry.Image.HubLink }}) {{ else }} {{ .Entry.Image }} {{ end }} has been released on {{ .Entry.Manifest.Created }}";
  };
in

{
  lexopod.containers.diun = {
    imageName = "crazymax/diun";
    imageTag = "4.33.0";

    environments = containerEnvironments;

    secretSupport = true;
    socketSupport = true;

    networks = ["proxy:ip=10.89.0.21"];

    volumes = ["diun-data:/data"];
  };
}
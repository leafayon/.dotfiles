let
  containerEnvironments = {
    AUTH_USERNAME = "admin";
    AUTH_PASSWORD = "admin";
    DB_CONNECTION_TYPE = "host";
    DB_DRIVER = "mysql";
    DB_HOST = "10.89.0.27";
    DB_NAME = "cypht";
    DB_USER = "cypht";
    DB_PASS = "cypht_password";
    SESSION_TYPE = "DB";
    USER_CONFIG_TYPE = "DB";
  };
in

{
  lexopod.containers.cypht = {
    imageName = "cypht/cypht";
    imageTag = "2.12.2";

    environments = containerEnvironments;

    dependsOn = ["cypht_mariadb"];

    caddySupport = true;
    caddyDomainName = "webmail";
    caddyServicePort = 80;

    networks = ["proxy:ip=10.89.0.26"];

    volumes = [
      "cypht-log:/var/log"
      "cypht-fonts:/usr/local/share/cypht/site/fonts"
    ];
  };

  lexopod.containers.cypht_mariadb = {
    imageName = "mariadb";
    imageTag = "10";

    environments = {
      MYSQL_ROOT_PASSWORD = "root_password";
      MYSQL_DATABASE = "cypht";
      MYSQL_USER = "cypht";
      MYSQL_PASSWORD = "cypht_password";
    };

    networks = ["proxy:ip=10.89.0.27"];

    volumes = ["cypht_mariadb-data:/var/lib/mysql"];
  };
}
# DemocracyOS Docker Keycloak Image
This is [DemocracyOS](http://democracyos.org/) official [Keycloak](https://www.keycloak.org/) Docker image for development. It's based on [Keycloak Official Docker Image](https://hub.docker.com/r/jboss/keycloak/), starting with 4.4.0.Final version.

## Quickstart
---
### Pull this image
```bash
$ sudo docker pull ????????
```

### Start keycloak
*Nice to read multiline*
```bash
$ sudo docker run -d --name keycloak \
                  -p 8080:8080 \
                  -e "KEYCLOAK_USER=democracyos" \
                  -e "KEYCLOAK_PASSWORD=democracyos" \
                  -e "KEYCLOAK_WELCOME_THEME=democracyos" \
                  democracyos/keycloak:4.4.0.Final
```

*Copy & Paste friendly one-liner*
```bash
$ sudo docker run -d --name keycloak -p 8080:8080 -e "KEYCLOAK_USER=democracyos" -e "KEYCLOAK_PASSWORD=democracyos" -e "KEYCLOAK_WELCOME_THEME=democracyos" democracyos/keycloak:4.4.0.Final
```

### Access Keycloak
Browse to http://localhost:8080 and go to Administration Console.
![Keycloak landing](https://raw.githubusercontent.com/DemocracyOS/keycloak/master/img/kc_1.png)

Login with user: democracyos and password: democracyos.
![Keycloak login](https://raw.githubusercontent.com/DemocracyOS/keycloak/master/img/kc_2.png)

Set DemocracyOS theme
![Keycloak theme configuration](https://raw.githubusercontent.com/DemocracyOS/keycloak/master/img/kc_3.png)


## Customize DemocracyOS theme
---
Themes are built with [Apache FreeMarker](https://freemarker.apache.org/). This keycloak docker installation is configured to instantly reflect changes in theme files for development purposes. More on this in the [Official Documentation](https://www.keycloak.org/docs/4.4/server_development/index.html#_themes).

To live edit DemocracyOS, with this repository files please run:

*Nice to read multiline*
```bash
$ sudo docker run -d --name keycloak \
                  -p 8080:8080 \
                  -e "KEYCLOAK_USER=democracyos" \
                  -e "KEYCLOAK_PASSWORD=democracyos" \
                  -e "KEYCLOAK_WELCOME_THEME=democracyos" \
                  -v $(pwd)/democracyos:/opt/jboss/keycloak/themes/democracyos:rw
                  democracyos/keycloak:4.4.0.Final
```

*Copy & Paste friendly one-liner*
```bash
$ sudo docker run -d --name keycloak -p 8080:8080 -e "KEYCLOAK_USER=democracyos" -e "KEYCLOAK_PASSWORD=democracyos" -e "KEYCLOAK_WELCOME_THEME=democracyos" -v $(pwd)/democracyos:/opt/jboss/keycloak/themes/democracyos:rw democracyos/keycloak:4.4.0.Final
```

### Docker Image files
DemocracyOS theme files are inside `democracyos/` directory while custom configurations reside in `customization` directory. All content is copied during docker build.

## Docker Environment Variables
---
As seen in _Start Keycloak_ section, some variables are needed to bootstrap Keycloak. As this is an extension of the official Docker image we recommend reading through the [Official Docker Image Documentation](https://hub.docker.com/r/jboss/keycloak/). Variables shown here are:

* `KEYCLOAK_USER`: set keycloak admin user. There's no default value, if it is not set then direct access to container shell is needed to use [kcadm](https://www.keycloak.org/docs/4.4/server_admin/#the-admin-cli).
* `KEYCLOAK_PASSWORD`: set keycloak admin user password. There's no default value, if it is not set then direct access to container shell is needed to use [kcadm](https://www.keycloak.org/docs/4.4/server_admin/#the-admin-cli).
* `KEYCLOAK_WELCOME_THEME`: specify the theme to use for welcome page (must be non empty and must match an existing theme name).

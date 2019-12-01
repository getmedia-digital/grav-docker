# GRAV CMS Docker

![Docker Build Status](https://img.shields.io/docker/cloud/build/getmedia/grav-cms?style=flat-square) ![GitHub issues](https://img.shields.io/github/issues/getmedia-digital/grav-docker?style=flat-square) ![GitHub](https://img.shields.io/github/license/getmedia-digital/grav-docker?style=flat-square)

GRAV CMS Docker is build on Alpine linux which provides small, stable and effective environment for running the awesome [GRAV CMS](https://getgrav.org). It is optimised for both, production and development.

Get this image from [Docker Hub](https://hub.docker.com/r/getmedia/grav-cms).
```
getmedia/grav-cms
```

## Setting up ENV

| Variable | Description | Default value |
| --- | --- | --- |
| **GRAV_VERSION** | Specifies version of GRAV CMS  | _latest_ |
| **GRAV_ADMIN** | Includes GRAV Admin | _true_ |
| **HTTP_PORT** | Specifies an UDP port where GRAV listens  | _8080_ |

_Env variables are currently ignored. This feature will be available in any of next releases._

## Running the container

There are various ways how to run your GRAV CMS Docker. For development, [Docker Compose](#docker-compose) is your best call. For production environment, you probably want to go with [Kubernetes](#kubernetes) or [Helm Charts](#helm).

### Docker

_Coming soon_

### Docker Compose

This is extremely useful for theme development. Just create a `docker-compose.yml` in your theme root.

```
version: '3'
services:
    grav:
        image: "treatys/grav-cms"
        container_name: grav_cms
        env:
            GRAV_VERSION: latest
        ports:
          - 8080:8080
        volumes:
          - ./:/var/www/html/user/themes/{your-theme-dir}
          - ./.data/config:/var/www/html/user/config
          - ./.data/data:/var/www/html/user/data
          - ./.data/images:/var/www/html/user/images
          - ./.data/accounts:/var/www/html/user/accounts
          - ./.data/pages:/var/www/html/user/pages
          - ./.data/plugins:/var/www/html/user/plugins

```

Create `.data` directory in your project root. Do not forget to add this path to `.gitignore` file. Now you have persistent GRAV Docker for your development.

Just start it

```bash
docker-compose up -d
```

and enjoy it on `http://localhost:8080`.

### Kubernetes

_Coming soon_

### Helm

_Coming soon_

## Contributing

You are free to contribute this project, just create a Pull request. We will review it and optionaly include it in one of next releases. 

## Support

We are happy to provide support. Just contact us on support@getmedia.digital, ask on [GRAV CMS Discord](https://discord.gg/5VhYVkR) or bring up an [issue](https://github.com/getmedia-digital/grav-docker/issues/new).

## License

This project is under GNU GPL v3. See [license](LICENSE)

## Maintaner

GRAV CMS Image is maintained by [GET Media Digital](https://getmedia.digital).

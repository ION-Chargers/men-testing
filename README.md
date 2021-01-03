# MEN Testing Image

This image is intended to run CI testing on Gitlab for monolitic applications
based on NodeJS and MongoDB. This image is not intended for production
purposes.

## Building the image:

For building a new image:

```bash
docker build -f Dockerfile -t men-testing:latest .
```

## Creating a container from the image:

The following command will create a dettached container:

```bash
NAME=nodejs_playground
DEVDIR=/builds/
IMAGE=men-testing
docker run -ti --publish 3000:3000 --detach --name ${NAME} -v $(pwd):${DEVDIR} \
  ${IMAGE}
```

## Running a container:

```bash
docker exec -ti ${NAME} bash
```

## Removing the container:

```bash
docker rm --force ${NAME}
```

v0.1.0

# vnc-gui-docker
GUI via VNC to docker container


To have a startup script
Create .xinitrc script, for example

```
exec xterm
```

Add to dockerfile

```Dockerfile
COPY .xinitrc /root/.xinitrc
```

To build container

```
podman build -t CONTAINER_NAME .
# OR if using Docker instead
docker build -t CONTAINER_NAME .
```

To run

```
podman run --rm --publish 5900:5900 CONTAINER_NAME
# OR if using Docker instead
docker run --rm --publish 5900:5900 CONTAINER_NAME
```


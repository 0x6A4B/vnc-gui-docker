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


## Using with playwright



### Install Playwright Docker


```
mkdir playwright_volume
podman run --net=host -v $(pwd)/playwright_volume:/home/playwright --name playwright 0x6a4b/vnc-gui:latest
vncviewer localhost:5900    # Tai oma vnc client
```

```
apt update && apt install neovim npm tint2


# Use the installed Openbox WM or just install your preferred one
# Openboxi has altdrag, menu accessible with mouse rightclick on desktop
# Setting openbox and taskbar to start when logging in
echo "exec openbox &" >> /root/.bashrc
echo "exec tint2 &" >> /root/.bashrc

# Run openbox now
openbox &

mkdir -p /home/playwright/test && cd $_

# Install and initialize playwright
npm init playwright
npx playwright test && npx playwright show-report
# Check networking works with host computer
# localhost:9323 should show the report in host's browser

# After adding headless we can test playwright functions correctly
# with browser in the vnc container
npx playwright codegen yle.fi
```

### Run playwright

```
docker start playwright
vncviewer localhost:5900
```

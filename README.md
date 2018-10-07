# Dockerized videoP2Proxy (Xiaomi Aqara RTSP stream)

Thanks for @miguelangel-nubla, finally we can get RTSP stream from Xiaomi Aqara Cameras via P2P to RTSP proxy.

**Original repository and credits:**

https://github.com/miguelangel-nubla/videoP2Proxy

I just made a docker container for the whole stuff to install, build and run the script.

RTSP stream can be reached on 8554 port if you use the docker command below.

To obtain **device token** I used the following description (method 3):

https://github.com/jghaanstra/com.xiaomi-miio/blob/master/docs/obtain_token.md#method-3---obtain-mi-home-device-token-for-devices-that-hide-their-tokens-after-setup

---
**Docker command:**

```bash
docker run --name xiaomi-aqara-rtsp \
  --restart=always \
  -e IP=<IP_ADDRESS> \
  -e TOKEN=<DEVICE_TOKEN> \
  -p 8554:8554 \
  -d humpedli/docker-xiaomi-aqara-rtsp
```

---
**Docker compose:**

```bash
version: '3'
services:
  xiaomi-aqara-rtsp:
    container_name: "xiaomi-aqara-rtsp"
    image: "humpedli/docker-xiaomi-aqara-camera-rtsp"
    ports:
      - "8554:8554"
    environment:
      - "IP=<IP_ADDRESS>"
      - "TOKEN=<DEVICE_TOKEN>"
    restart: "always"
```

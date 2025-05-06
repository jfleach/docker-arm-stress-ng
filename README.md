# docker-arm-stress-ng
Lightweight docker images for stress-ng (for Linux ARM 64/7/6)

## stress-ng

<img src=./stress-ng.png width="100" height="100">

The documentation is [here](http://kernel.ubuntu.com/~cking/stress-ng/)

## Docker buildx instructions

The documentation is [here](https://community.arm.com/developer/tools-software/tools/b/tools-software-ides-blog/posts/getting-started-with-docker-for-arm-on-linux/)

## Local build

```
$ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 .
```

## Pull from Docker Hub

```
$ docker pull jfleach/docker-arm-stress-ng
```

## Run

Display usages:

```
$ docker run -it --rm jfleach/docker-arm-stress-ng
stress-ng, version 0.03.11

Usage: stress-ng [OPTION [ARG]]
 --h,  --help             show help
...
```

Run stress workers:

```
$ docker run -it --rm jfleach/docker-arm-stress-ng --cpu 4 --vm 2 --hdd 1 --fork 8 --switch 4 --timeout 15s --metrics-brief
stress-ng: info: [1] dispatching hogs: 4 cpu, 8 fork, 1 hdd, 4 switch, 2 vm
stress-ng: info: [1] successful run completed in 15.12s
stress-ng: info: [1] stressor      bogo ops real time  usr time  sys time   bogo ops/s   bogo ops/s
stress-ng: info: [1]                          (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: info: [1] cpu               6430     15.04     38.35      0.00       427.40       167.67
stress-ng: info: [1] fork             13247     15.00      1.09      0.95       883.21      6493.63
stress-ng: info: [1] hdd             175940     15.12      0.08      8.44     11639.73     20650.23
stress-ng: info: [1] switch        21379932     15.00     19.06     30.82   1425241.57    428627.35
stress-ng: info: [1] vm              617536     15.02     17.25      1.87     41117.00     32297.91
```

## Docker hub

[Repository](https://hub.docker.com/r/jfleach/docker-arm-stress-ng)

## License

[MIT](LICENSE)

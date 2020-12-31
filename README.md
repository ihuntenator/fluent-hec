# fluentd-hec

Using fluentd to read docker container json-file log files, filtering, and output to HEC.

## Build image

```
make build
```

## Build and push image

```
make all
```

Test with fluentd-lab


## Run container manual

```
docker run -d -v /var/lib/docker/containers:/var/lib/docker/containers:Z ihuntenator/fluentd-hec:[tag]
```


## Trouble shoot container

```
docker run -it -v /var/lib/docker/containers:/var/lib/docker/containers:Z ihuntenator/fluentd-hec:[tag] bash
```

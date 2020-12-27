# fluentd-hec

Using fluentd to read docker container json-file log files, filtering, and output to HEC.

## Build Log Aggregator Image

Run to build image:
```
docker/build.sh tag
```

## Run Log Aggregator Container

```
docker run -d -v /var/lib/docker/containers:/containers ihuntenator/fluentd-hec:[tag]
```


## Trouble shhot container

```
docker run -it -v /var/lib/docker/containers:/containers ihuntenator/fluentd-hec:[tag] bash
```

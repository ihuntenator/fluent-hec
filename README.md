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


## Testing

Run the following in a terminal:
```
docker run -it -p 24224:24224 ihuntenator/fluentd:1.9
```
In a second terminal run:
```
docker exec -it $(docker ps -l -q) bash -c "echo '{\"json\":\"message\"}' | fluent-cat test"
```
Check the output in the first terminal window, should see something like:
```
2021-02-08 07:55:04.454906300 +0000 test: {"json":"message"}
```

## Trouble shoot container

```
docker run -it -v /var/lib/docker/containers:/var/lib/docker/containers:Z ihuntenator/fluentd-hec:[tag] bash
```

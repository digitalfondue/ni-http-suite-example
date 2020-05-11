# build and run with podman/docker

```
podman build -f Dockerfile -t ni-http-suite-example/ni-http-suite-example .
podman run -i --rm -p 8080:8080 localhost/ni-http-suite-example/ni-http-suite-example:latest
``

# Deploy as a function on gcp cloud run

You must build in docker format (!)

``
podman build --format=docker -f Dockerfile -t ni-http-suite-example/ni-http-suite-example .
```



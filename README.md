# Minimal "function" example of ni-http-suite

This will build a 9.2mb docker image.

Note: it can be even smaller as I've enabled "--enable-url-protocols=https".

This is based from the blog post of https://jamesward.com/2020/05/07/graalvm-native-image-tips-tricks/ for the -static+muslc trick.


# build and run with podman/docker locally

```
podman build -f Dockerfile -t ni-http-suite-example/ni-http-suite-example .
podman run -i --rm -p 8080:8080 localhost/ni-http-suite-example/ni-http-suite-example:latest
```

# Deploy as a function on gcp cloud run

You must build in docker format (!)

```
podman build --format=docker -f Dockerfile -t ni-http-suite-example/ni-http-suite-example .
podman tag TAG gcr.io/PROJECT_ID/NAME
podman push gcr.io/PROJECT_ID/NAME
gcloud run deploy --platform=managed --allow-unauthenticated --image=gcr.io/PROJECT_ID/NAME
```

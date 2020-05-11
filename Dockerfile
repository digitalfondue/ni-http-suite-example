FROM oracle/graalvm-ce:20.0.0-java11 as builder-cache

WORKDIR /app

RUN gu install native-image

RUN curl -L -o musl.tar.gz https://github.com/gradinac/musl-bundle-example/releases/download/v1.0/musl.tar.gz && \
    tar -xvzf musl.tar.gz

FROM builder-cache as builder

WORKDIR /app
COPY . /app

RUN ./mvnw verify -Pnative-image


FROM scratch

COPY --from=builder /app/target/ni-http-suite-example /ni-http-suite-example

ENTRYPOINT ["/ni-http-suite-example"]
# tensorflow-m1-docker

Binary Python wheel package for Tensorflow inside Docker. Should work on any platform, but useful for M1/Apple Silicon

```bash
docker build \
    --build-arg BASE="python:3.7-buster" \
    --build-arg BAZELISK="https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-arm64" \
    --build-arg TENSORFLOW_SOURCE="https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.6.0.tar.gz" \
    -t tensorflow \
    .
```

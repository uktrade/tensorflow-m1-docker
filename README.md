# tensorflow-m1-docker

Binary Python wheel package for Tensorflow inside Docker. This is most useful for M1/Apple Silicon. However, by replacing the `BAZELISK` build argument in the below example, this should also work on other platforms.

```bash
docker build \
    --build-arg BASE="python:3.7-buster" \
    --build-arg BAZELISK="https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-arm64" \
    --build-arg TENSORFLOW_SOURCE="https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.6.0.tar.gz" \
    -t tensorflow \
    .
```

At the end of the build the location of the `whl` file in the Docker image should be output to the console. If it is not, run the below:

```bash
docker run --rm -it -t tensorflow ls /tmp/tensorflow_pkg/
```

It is likely to be of the form `/tmp/tensorflow_pkg/tensorflow-<version>-<tags>.whl`. 


To copy it out of Docker to the local filesystem edit and run the below.

```bash
docker create --name tensorflow tensorflow
docker cp tensorflow:/tmp/tensorflow_pkg/tensorflow-<version>-<tags>.whl .
docker rm -f tensorflow
```

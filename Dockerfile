ARG BASE

FROM $BASE
ARG BAZELISK
ARG TENSORFLOW_SOURCE

RUN \
	wget "${BAZELISK}" -O bazel && \
	chmod +x ./bazel && \
	./bazel && \
	mv ./bazel /usr/local/bin

RUN \
	pip install numpy==1.21.3 wheel && \
	pip install keras_preprocessing --no-deps

RUN \
	wget "${TENSORFLOW_SOURCE}" -O tensorflow.tar.gz && \
	mkdir tensorflow && \
	tar -zxvf tensorflow.tar.gz -C tensorflow --strip-components=1

RUN \
	cd tensorflow && \
	./configure

RUN \
	cd tensorflow && \
	bazel build --local_cpu_resources=1 //tensorflow/tools/pip_package:build_pip_package

RUN \
	./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg


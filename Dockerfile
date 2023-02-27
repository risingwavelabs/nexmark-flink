FROM eclipse-temurin:11-jre-jammy

RUN apt-get update -yy && DEBIAN_FRONTEND=noninteractive apt-get -y install maven

RUN mkdir -p /nexmark-source
RUN mkdir -p /nexmark
COPY . /nexmark-source

RUN cd /nexmark-source/nexmark-flink && ./build.sh && tar -zxvf nexmark-flink.tgz && mv nexmark-flink/* /nexmark

WORKDIR /nexmark
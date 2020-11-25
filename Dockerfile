FROM alpine

LABEL maintainer="bacnh <mail@bacnh.com>"

ENV RTTYS_USERNAME="admin"
ENV RTTYS_PASSWORD="admin"
ENV RTTYS_TOKEN=""

ARG RTTYS_VERSION="3.1.3"
ARG RTTYS_RELEASE="4334190"
ARG RTTYS_CHECKSUM="289eb6811a20042469334c33737a820eaf34112c084f5e6da19f193b2e7af809"

EXPOSE 5912 5913

ADD https://github.com/zhaojh329/rttys/files/${RTTYS_RELEASE}/rttys-linux-amd64.tar.gz /tmp/rttys.tar.gz

RUN if [ "${RTTYS_CHECKSUM}" != "$(sha256sum /tmp/rttys.tar.gz | awk '{print $1}')" ]; then exit 1; fi \
  && rm -rf /rttys \
  && mkdir /rttys \
  && tar -zxf /tmp/rttys.tar.gz -C /rttys --strip-components 1 \
  && rm -rf /tmp/rttys.tar.gz 

WORKDIR /rttys
COPY entrypoint.sh /
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

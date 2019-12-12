FROM ubuntu:16.04
ENV SHELL /bin/bash
ENV GOPATH=/root/go

USER root

RUN apt-get -y update && \
    apt-get install -y lsb-release iproute2 sudo vim curl git make build-essential && \
    mkdir -p /tmp/lftl && \
    curl https://storage.googleapis.com/golang/go1.13.5.linux-amd64.tar.gz -o /tmp/lftl/go1.13.5.linux-amd64.tar.gz && \
    tar zxpvf /tmp/lftl/go1.13.5.linux-amd64.tar.gz -C /usr/local && \
    cd /tmp/lftl && \
    git clone https://github.com/gohugoio/hugo.git && \
    cd hugo && \
    /usr/local/go/bin/go install --tags extended

CMD ["/bin/bash"]
ENTRYPOINT ["/bin/bash", "-c"]

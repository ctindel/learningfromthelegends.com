# Creating a docker repository for running hugo

```
docker run --restart always --name lftl -h lftl -p 8080:1313 --entrypoint=/bin/bash -it -v /Users/ctindel/src/learningfromthelegends.com:/mnt/learningfromthelegends.com ubuntu:16.04

apt-get update && apt-get install -y lsb-release iproute2 sudo vim curl git make build-essential 

mkdir -p /tmp/lftl
curl https://storage.googleapis.com/golang/go1.13.5.linux-amd64.tar.gz -o /tmp/lftl/go1.13.5.linux-amd64.tar.gz
tar zxpvf /tmp/lftl/go1.13.5.linux-amd64.tar.gz -C /usr/local
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

cd /tmp/lftl
git clone https://github.com/gohugoio/hugo.git
cd hugo
go install --tags extended
```

# Running the hugo webserver inside the docker container

```
cd /mnt/learningfromthelegends.com

~/go/bin/hugo server -w --bind 0.0.0.0 -b http://localhost:8080/ --disableFastRender --appendPort=false
```

Load [http://localhost:8080] in your browser

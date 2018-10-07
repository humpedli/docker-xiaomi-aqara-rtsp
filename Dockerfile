FROM python:3-stretch

# set workdir
WORKDIR /usr/src/app

# install dependencies
RUN apt-get update && apt-get -y dist-upgrade && \
	apt-get -y install liblivemedia-dev libjson-c-dev

# cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# install python dependencies
RUN pip3 install python-miio

# clone code
RUN git clone https://github.com/miguelangel-nubla/videoP2Proxy.git .

# build code
RUN ./autogen.sh
RUN make
RUN make install

# run code
CMD videop2proxy --ip $IP --token $TOKEN --rtsp 8554

# expose port
EXPOSE 8554
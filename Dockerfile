FROM servebox/phantomjs:latest

# Java 8 & Clojure
RUN apt-get update &&\
    apt-get install software-properties-common -y &&\
    add-apt-repository ppa:webupd8team/java -y &&\
    apt-get update &&\
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections &&\
    apt-get install -y oracle-java8-installer &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LEIN_ROOT true
RUN wget -q -O /usr/bin/lein \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein && \
    lein
    
RUN echo "Australia/Melbourne" | sudo tee /etc/timezone &&\
dpkg-reconfigure --frontend noninteractive tzdata

CMD ["bash"]

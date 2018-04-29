FROM elasticsearch:2.4.6
MAINTAINER Delron Kung "delron.kung@gmail.com"

RUN apt-get update && \
            apt-get install -y --no-install-recommends --force-yes maven openjdk-8-jdk && \
                rm -rf /var/lib/apt/lists/*
COPY ./elasticsearch-analysis-ik-1.10.6.tar.gz /tmp/
RUN tar -xvf /tmp/elasticsearch-analysis-ik-1.10.6.tar.gz -C /tmp && \
    cd /tmp/elasticsearch-analysis-ik-1.10.6 && \
        mvn package && \
            unzip target/releases/elasticsearch-analysis-ik-1.10.6.zip -d /usr/share/elasticsearch/plugins/analysis-ik && \
                cd / && \
                    rm -rf /tmp/elasticsearch-analysis-ik*

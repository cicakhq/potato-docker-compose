FROM solr:6.1.0

USER root
RUN apt-get update && apt-get install -y git

USER solr
RUN cd /tmp && \
    git clone https://github.com/cicakhq/potato && \
    cd potato && \
    git checkout 16d950f3da2a1cb6e9ff1f22532d5a439f482017

RUN mkdir -p server/solr/potato/conf && \
    cp example/files/conf/stopwords.txt \
       example/files/conf/synonyms.txt \
       example/files/conf/protwords.txt \
       example/files/conf/elevate.xml \
       example/files/conf/currency.xml server/solr/potato/conf && \
    cp -R example/files/conf/lang server/solr/potato

RUN cp /tmp/potato/deploy/roles/solr/files/schema.xml \
       /tmp/potato/deploy/roles/solr/files/solrconfig.xml server/solr/potato/conf

RUN bin/solr start && \
    bin/solr create -c potato && \
    bin/solr stop

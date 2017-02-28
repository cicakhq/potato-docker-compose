FROM solr:6.1.0

USER root
RUN apt-get update && apt-get install -y git

USER solr
RUN cd /tmp && \
    git clone https://github.com/cicakhq/potato && \
    cd potato && \
    git checkout ec6d870492b2305d150bfee5e5dc194a953838f7

RUN mkdir -p server/solr/potato/conf && \
    cp example/files/conf/stopwords.txt \
       example/files/conf/synonyms.txt \
       example/files/conf/protwords.txt \
       example/files/conf/currency.xml server/solr/potato/conf && \
    cp -R example/files/conf/lang server/solr/potato

RUN cp /tmp/potato/deploy/roles/solr/files/schema.xml \
       /tmp/potato/deploy/roles/solr/files/elevate.xml \
       /tmp/potato/deploy/roles/solr/files/solrconfig.xml server/solr/potato/conf

RUN bin/solr start && \
    bin/solr create -c potato && \
    bin/solr stop

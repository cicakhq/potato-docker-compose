FROM solr:6.1.0

USER root
RUN apt-get update && apt-get install -y git

USER solr
RUN cd /tmp && \
    git clone https://github.com/cicakhq/potato && \
    cd potato && \
    git checkout 14e255701c37164f6216956e2244ecb74623a87b

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

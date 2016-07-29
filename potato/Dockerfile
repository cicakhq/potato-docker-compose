FROM potato

ENV POTATO_WORK /potato

RUN apt-get install -y curl

ADD wait-for-it.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wait-for-it.sh

ADD start.sh $POTATO_WORK/start.sh
RUN chmod +x $POTATO_WORK/start.sh

ADD potato.cfg $POTATO_WORK/potato.cfg

ENTRYPOINT ["/potato/start.sh"]

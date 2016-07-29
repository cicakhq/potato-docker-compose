FROM potato

ENV POTATO_WORK /potato

RUN apt-get install -y curl

COPY wait-for-it.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wait-for-it.sh

COPY start.sh $POTATO_WORK/start.sh
RUN chmod +x $POTATO_WORK/start.sh

COPY cmd.sh $POTATO_WORK/cmd.sh
RUN chmod +x $POTATO_WORK/cmd.sh

COPY potato.cfg $POTATO_WORK/potato.cfg

VOLUME ["/var/potato/files"]

ENTRYPOINT ["/potato/start.sh"]

FROM ubuntu:16.04

ENV LOG_DIR	 "/logs"
ENV PROFTPD_USER proftpd	
ENV SERVER_NAME	 logs.memority.com
ENV USER_NAME	 memorityps

# Setup proftpd
RUN apt-get update \
	&& apt-get install -y proftpd \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir $LOG_DIR \
	&& chown -R $PROFTPD_USER $LOG_DIR 

ADD docker-entrypoint.sh /usr/local/bin

ADD proftpd.conf /etc/proftpd/proftpd.conf

EXPOSE 20 21 49152-49162

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["proftpd", "--nodaemon" ]

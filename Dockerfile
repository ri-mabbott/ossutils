#FROM alpine:latest
FROM debian:stretch

# Debian commands
RUN apt-get -y update
RUN apt-get -y install wget

# Fetch OSS Util
RUN wget -O /usr/local/bin/ossutil64 http://gosspublic.alicdn.com/ossutil/1.6.10/ossutil64
RUN chmod 755 /usr/local/bin/ossutil64

# Remove wget as no longer required
RUN apt-get purge -y --auto-remove wget

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["ossutil64"]

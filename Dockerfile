FROM debian:8.9

RUN apt-get update && apt-get install -y vim shellinabox

COPY docker-command.sh /
RUN  chmod +x /docker-command.sh

ENV USERNAME="user"

CMD ["/docker-command.sh"] 

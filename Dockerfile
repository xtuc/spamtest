FROM ubuntu

RUN apt-get update && apt-get install -y spamassassin spamc
RUN useradd spamd

CMD spamd --daemonize && spamc -R

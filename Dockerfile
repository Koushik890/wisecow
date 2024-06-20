FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:${PATH}"

RUN which cowsay && which fortune

RUN mkdir /home/app/

COPY wisecow.sh /home/app/

RUN chmod +x /home/app/wisecow.sh

EXPOSE 4499

CMD ["/home/app/wisecow.sh"]

FROM ubuntu:latest 

RUN apt-get update && apt-get install --yes python3
RUN apt-get install tor --yes
RUN apt-get install python3-pip --yes
RUN pip3 install requests


COPY HexfallWebsite/ /hexfall/

RUN echo "HiddenServiceDir /var/lib/tor/hidden_service/" >> /etc/tor/torrc
RUN echo "HiddenServicePort 80 127.0.0.1:8080" >> /etc/tor/torrc
COPY run.sh /onion/run.sh
COPY index.html /onion/index.html

# add login .env creds here
# RUN adduser admin
# USER admin
EXPOSE 8080
EXPOSE 8000
WORKDIR /onion
ENTRYPOINT ["./run.sh"]

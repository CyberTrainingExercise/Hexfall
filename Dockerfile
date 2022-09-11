FROM ubuntu:latest 

RUN apt-get update && apt-get install --yes python3
RUN apt-get install tor --yes
RUN apt-get install python3-pip --yes
RUN pip3 install requests


COPY HexfallWebsite/ /hexfall/

RUN echo "HiddenServiceDir /var/lib/tor/hidden_service/" >> /etc/tor/torrc
RUN echo "HiddenServicePort 80 127.0.0.1:8080" >> /etc/tor/torrc

# add login .env creds here
# RUN adduser admin
# USER admin
WORKDIR /hexfall
ENTRYPOINT ["python3", "-m", "http.server", "--bind", "127.0.0.1", "8080"]

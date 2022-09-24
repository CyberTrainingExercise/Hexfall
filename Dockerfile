FROM ubuntu:latest 

# Install required files
RUN apt-get update && apt-get install --yes python3
RUN apt-get install tor --yes
RUN apt-get install openssh-server --yes
RUN apt-get install python3-pip --yes
RUN pip3 install requests

# Copy over the website
COPY HexfallWebsite/ /hexfall/
# Copy over service files
RUN echo "HiddenServiceDir /var/lib/tor/hidden_service/" >> /etc/tor/torrc
RUN echo "HiddenServicePort 80 127.0.0.1:8080" >> /etc/tor/torrc
COPY run.sh /onion/run.sh
COPY index.html /onion/index.html

# # Add the admin user with password openup11
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup admin
RUN usermod -p open admin
RUN mkdir -p /home/admin/.ssh
# If the below line fails, please generate an authorized key
COPY authorized_keys /home/admin/.ssh/authorized_keys
RUN chown admin:sshgroup /home/admin/.ssh/authorized_keys && chmod 600 /home/admin/.ssh/authorized_keys

# Expose ports and set the entrypoint to the run script
EXPOSE 8080 8000 8022 80
WORKDIR /onion
ENTRYPOINT ["./run.sh"]

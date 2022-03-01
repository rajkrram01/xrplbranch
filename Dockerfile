FROM ubuntu:20.04
RUN apt update -y
RUN apt install apt-transport-https ca-certificates wget gnupg -y
RUN wget -q -O - "https://repos.ripple.com/repos/api/gpg/key/public" | apt-key add -
RUN apt-key finger
RUN echo "deb https://repos.ripple.com/repos/rippled-deb bionic stable" | tee -a /etc/apt/sources.list.d/ripple.list
RUN apt update -y   
RUN apt install rippled -y        
RUN apt install systemctl -y
CMD ["systemctl status rippled.service","systemctl start rippled.service","systemctl enable rippled.service"]
COPY ./script.sh /
RUN chmod +x /script.sh
ENTRYPOINT ["/script.sh"]

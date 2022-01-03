FROM ubuntu:20.04
RUN apt-get install openjdk-11-jre-headless -y
RUN apt-get insatll wget -y
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt-get apt update
RUN apt install jenkins -y
RUN systemctl status jenkins
RUN systemctl start jenkins
RUN ufw enable
RUN ufw allow 8080/tcp
RUN ufw reload

FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install openjdk-8-jdk -y
RUN curl https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install jenkins -y
RUN service jenkins start 
RUN systemctl enable jenkins 


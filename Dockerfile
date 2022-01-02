FROM jenkins/jenkins:2.213
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
COPY executors.groovy /executors.groovy
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/install-plugins.sh < /plugins.txt
USER root
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
COPY ./ssh/. /root/.ssh/
COPY ./*.sh /var/jenkins_home/ 
COPY ./requirements.txt /var/jenkins_home/
COPY ./config.json /var/jenkins_home/
RUN chmod +x /var/jenkins_home/setup_python.sh && \
	/var/jenkins_home/setup_python.sh && \
	pip install -r /var/jenkins_home/requirements.txt && \
	chmod +x /var/jenkins_home/other_dependencies.sh && \
	/var/jenkins_home/other_dependencies.sh
RUN mkdir -p /home/ftp_user/ftp && chown -R jenkins:jenkins /home/ftp_user
USER jenkins
COPY ./ssh/. /var/jenkins_home/.ssh/

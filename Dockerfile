FROM gitlab/gitlab-runner

#refresh system
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade

#Install important tex packages
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN apt-get install -y texlive-full biber sudo curl

#Install important avr packages
RUN apt-get install -y avr-libc binutils-avr gcc-avr avrdude build-essential

ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]

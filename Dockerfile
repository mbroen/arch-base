FROM base/archlinux

ADD build/*.sh /root/
ADD build/supervisor.conf /etc/supervisor.conf
ADD build/bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/* && \
    /usr/local/bin/docker-build

ENV HOME /home/nobody
ENV LANG en_GB.UTF-8

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf", "-n"]

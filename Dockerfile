FROM base/archlinux

ADD build/*.sh /root/
ADD build/supervisor.conf /etc/supervisor.conf

RUN chmod +x /root/*.sh && \
    cd /root/ && \
    /bin/bash /root/build.sh

ENV HOME /home/nobody
ENV LANG en_GB.UTF-8

ENTRYPOINT ["/usr/bin/tini", "--"]

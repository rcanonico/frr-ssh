FROM quay.io/frrouting/frr:10.1.0
RUN apk add --update --no-cache openssh
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo "frr:frr" | chpasswd
RUN sed -i 's#/sbin/nologin#/usr/bin/vtysh#g' /etc/passwd
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh /
COPY frr.conf /etc/frr
COPY vtysh.conf /etc/frr

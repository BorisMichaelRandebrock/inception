FROM debian:bullseye

RUN apt update && apt install -y mariadb-server gettext

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql
COPY start.sh .
COPY envsubst.sh /envsubst.sh

RUN mkdir -p /run/mysqld
RUN cp /etc/mysql/init.sql /etc/mysql/init.sql.template
RUN cp /etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf.template
RUN chmod +x start.sh
RUN chmod +x envsubst.sh
ENTRYPOINT ["/envsubst.sh"]
CMD ["./start.sh"]

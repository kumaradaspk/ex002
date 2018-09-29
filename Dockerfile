FROM 10.150.19.27:8123/centostest:1.03
RUN yum install -y \
  jdk \
  mariadb-server  \
  hostname \
  net-tools \ 
  psmisc \
  mariadb-server \
  mariadb;

ADD ./config.sh /config.sh

RUN chmod 755 config.sh
RUN sh config.sh

ADD target/TodoDemo-0.0.1-SNAPSHOT.war /root/

EXPOSE 3306
EXPOSE 8080
CMD ["/usr/bin/mysqld_safe"]
ENTRYPOINT ["java","/root/TodoDemo-0.0.1-SNAPSHOT.war" ]

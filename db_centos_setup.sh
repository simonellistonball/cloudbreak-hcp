#!/bin/bash
# Setup the metron rest database
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
rpm -ivh mysql57-community-release-el7-9.noarch.rpm
yum update -y
yum install -y mysql-server
service mysqld start
passwd=`grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1 | cut -d':' -f4- | awk '{gsub(/^ +| +$/,"")} {print}'`
cat <<-EOF | mysql -u root --password=$passwd --connect-expired-password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Password_123';
CREATE DATABASE IF NOT EXISTS metron;
GRANT ALL PRIVILEGES ON metron.* TO 'metron'@'%' identified by 'Metron@123';
GRANT ALL PRIVILEGES ON mysql.* TO 'metron'@'%' identified by 'Metron@123';
GRANT ALL PRIVILEGES ON metron.* TO 'metron'@'localhost' identified by 'Metron@123';
GRANT ALL PRIVILEGES ON mysql.* TO 'metron'@'localhost' identified by 'Metron@123';


use metron;

create table if not exists users(
 username varchar(50) not null primary key,
 password varchar(50) not null,
 enabled boolean not null
);
create table authorities (
 username varchar(50) not null,
 authority varchar(50) not null,
 constraint fk_authorities_users foreign key(username) references
 users(username)
);
create unique index ix_auth_username on authorities (username,authority);

insert into users (username, password, enabled) values ('admin', 'admin',1);
insert into authorities (username, authority) values ('admin', 'ROLE_USER');
insert into authorities (username, authority) values ('admin', 'ROLE_ADMIN');

FLUSH PRIVILEGES;

EOF

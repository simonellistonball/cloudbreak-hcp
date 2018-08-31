#!/bin/bash

# Setup the metron rest database 
yum install -y mysql-server 
service mysqld start

cat <<-EOF | mysql -u root
CREATE DATABASE IF NOT EXISTS metron;
GRANT ALL PRIVILEGES ON metron.* TO 'metron'@'' identified by 'metron';

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

FLUSH PRIVILEGES;

EOF


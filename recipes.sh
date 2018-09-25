#!/bin/sh
#If some of the below delete fails with exit!=0 the script continues anyway as if the script is executed for the first time there may not be any recipes exists.
set +e
cb recipe delete --name mysql-client
cb recipe delete --name metron-db-setup
cb recipe delete --name nodejs
cb recipe delete --name requests-upgrade
cb recipe delete --name kdc-fix

# Enable exit on non 0
set -e
cb recipe create from-file --name mysql-client --execution-type pre-ambari-start --file mysql_recipe.sh
cb recipe create from-file --name metron-db-setup --execution-type post-ambari-start --file db_setup.sh
cb recipe create from-file --name nodejs --execution-type pre-ambari-start --file nodejs.sh
cb recipe create from-file --name requests-upgrade --execution-type pre-ambari-start --file requests_upgrade.sh
cb recipe create from-file --name kdc-fix --execution-type pre-ambari-start --file kdc-fix.sh

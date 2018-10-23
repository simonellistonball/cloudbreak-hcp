#!/bin/sh

cb blueprint delete --name "HCP 1.6"
cb blueprint create from-file \
  --file blueprint.json \
  --name "HCP 1.6" \
  --description "Hortonworks Cybersecuriy Platform version 1.6"

cb blueprint delete --name "HCP 1.7"
cb blueprint create from-file \
  --file blueprint.json \
  --name "HCP 1.7" \
  --description "Hortonworks Cybersecuriy Platform version 1.7"


cb blueprint delete --name "HCP - Compact" 
cb blueprint create from-file \
  --file blueprint-compact.json \
  --name "HCP - Compact" \
  --description "Development version of Hortonworks Cybersecuriy Platform for trial in smaller environments"

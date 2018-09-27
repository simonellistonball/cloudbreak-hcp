#!/bin/sh

cb blueprint delete --name "HCP"
cb blueprint create from-file \
  --file blueprint.json \
  --name "HCP" \
  --description "Hortonworks Cybersecuriy Platform"


cb blueprint delete --name "HCP - Compact" 
cb blueprint create from-file \
  --file blueprint-compact.json \
  --name "HCP - Compact" \
  --description "Development version of Hortonworks Cybersecuriy Platform for trial in smaller environments"

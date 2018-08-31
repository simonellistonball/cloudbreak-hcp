#!/bin/sh

cb blueprint delete --name HCP 
cb blueprint create from-file --file blueprint.json --name HCP --description "Hortonworks Cybersecuriy Platform"

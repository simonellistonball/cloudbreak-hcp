#!/bin/sh 

cb mpack create --name hdpsearch --url "http://public-repo-1.hortonworks.com/HDP-SOLR/hdp-solr-ambari-mp/solr-service-mpack-3.0.0.tar.gz" --description "HDP Search 3.0.0"
cb mpack create --name hcp160 --url "http://public-repo-1.hortonworks.com/HCP/centos6/1.x/updates/1.6.0.0/tars/metron/hcp-ambari-mpack-1.6.0.0-7.tar.gz" --description "HCP 1.6.0"
cb mpack create --name hdf312 --url "http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.2.0-7.tar.gz" --description "HDF 3.1.2"
cb mpack create --name hdf320 --url "http://public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.2.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.2.0.0-520.tar.gz" --description "HDF 3.2.0"
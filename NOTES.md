Ambari client failed to apply cluster creation template! Reason: { "status" : 400, "message" : "Topology validation failed: org.apache.ambari.server.topology.InvalidTopologyException: Missing required properties. Specify a value for these properties in the blueprint or cluster creation template configuration. {metron-rest-env=[metron_jdbc_driver, metron_jdbc_username, metron_jdbc_url], metron-env=[storm_rest_addr, es_hosts, zeppelin_server_url]}" }



In cloudbreak: database settings: 
com.sequenceiq.cloudbreak.validation.externaldatabase.SupportedDatabaseProvider

For the gateway bits... 
com.sequenceiq.cloudbreak.api.model.ExposedService
@Simon I think you should talk with akanto (akanto@hortonworks.com) because he is the knox expert in the team.
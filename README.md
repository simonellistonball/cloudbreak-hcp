# NOTE THIS IS WIP AND PROBABLY DOESN'T WORK YET

# HCP Cloudbreak Launcher

First setup cloudbreak and install the cloudbreak CLI on your machine, don't forget to configure it to your cloudbreak deployer.

Run `mpack.sh` to register the required mpacks with cloudbreak, this may show a failure on already registered mpacks, this is not a problem and can be ignored.

Run `blueprint.sh` to upload the default blueprint for HCP.

Run `recipes.sh` to upload the receipe scripts used.

Run `python cluster.py --name NAME_YOUR_CLUSTER` to deploy an HCP cluster, then log in to cloudbreak and watch it go.

## Options

You can change the aws region and zone by adding
aws:
  zone: us-east-2a
  region: us-east-2

to the config yaml.

You can force passwords and kerberos keys in config.yaml file. Any key set to RANDOM will get a 16 digit generated complex password.

## Template changes (advanced)

template.j2 is processed as a jinja template to create the cloudbreak template for each run. The temporary template actually used is deleted. You can change things like spot price, and instance types in the template.j2 file if you know what you're doing with Cloudbreak. 

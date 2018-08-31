from jinja2 import Template, Environment, FileSystemLoader, select_autoescape
import yaml
from tempfile import NamedTemporaryFile
import collections
import random
import string 
import argparse
import sys
import os
import subprocess
from datetime import datetime

def random_password():
  return ''.join(random.choice("^_-" + string.ascii_letters + string.digits) for _ in range(16))

def update(orig_dict, new_dict):
    for key, val in orig_dict.iteritems():
      if isinstance(val, collections.Mapping):
        tmp = update(orig_dict.get(key, { }), val)
        new_dict[key] = tmp
      elif isinstance(val, list):
        new_dict[key] = (orig_dict.get(key, []) + val)
      else:
        if orig_dict[key] == "RANDOM":
          new_dict[key] = random_password()
        else:
          new_dict[key] = orig_dict[key]
    return new_dict


parser = argparse.ArgumentParser(description='Create a HCP cluster in Cloudbreak')
parser.add_argument('--name', dest='name', type=str,
                   help='Name for the cluster')
args = parser.parse_args()
if args.name == None: 
  print("Must specify cluster name")
  sys.exit(1)

env = Environment(loader=FileSystemLoader('.'))

config = {
  'aws': {}
}

with open("config.yaml") as cf: 
  yamls = cf.read()
  cd = dict(yaml.load(yamls))
  update(cd, config)

with NamedTemporaryFile(delete=False) as tmp:
  template = env.get_template("template.j2")
  tmp.write(template.render(config))

template_file = tmp.name

try: 
  subprocess.check_call(["cb cluster create --cli-input-json {template_file} --name {cluster_name}".format(template_file = tmp.name, cluster_name = args.name)], shell=True)
  print(yaml.dump(config, default_flow_style=False))
  now = datetime.now().strftime("%Y%m%d%H%M%S")
  with open("config-{}.yaml".format(now), 'w') as fout:
    fout.write(yaml.dump(config, default_flow_style=False))
  with open("template-{}.yaml".format(now), 'w') as fout:
    fout.write(template.render(config))

except: 
  print(template.render(config))
 
os.remove(template_file)

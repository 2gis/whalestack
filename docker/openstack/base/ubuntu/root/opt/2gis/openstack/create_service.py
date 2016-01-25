import os
import argparse

from keystoneclient.v2_0 import client as keystone_client
from keystoneclient.exceptions import NotFound

endpoint = os.environ.get('KEYSTONE_ADMIN_URL',
                          os.environ.get('OS_SERVICE_ENDPOINT'))
token = os.environ.get('KEYSTONE_ADMIN_TOKEN',
                       os.environ.get('OS_SERVICE_TOKEN'))
keystone = keystone_client.Client(endpoint=endpoint,
                                  token=token)

parser = argparse.ArgumentParser(
    description='Create service for service if it does not exists')
parser.add_argument('--name', dest='name', required=True)
parser.add_argument('--description', dest='description', required=True)
parser.add_argument('--type', dest='type', required=True)

args = parser.parse_args()

try:
    service = keystone.services.find(name=args.name)
except NotFound:
    service = keystone.services.create(name=args.name, service_type=args.type,
                                       description=args.description)

print(service)

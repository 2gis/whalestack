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
    description='Create endpoint for service if it does not exists')
parser.add_argument('--service-name', dest='service_name', required=True)
parser.add_argument('--public-url', dest='public_url', required=True)
parser.add_argument('--admin-url', dest='admin_url', default=None)
parser.add_argument('--internal-url', dest='internal_url', default=None)

args = parser.parse_args()

service = keystone.services.find(name=args.service_name)
try:
    endpoint = keystone.endpoints.find(service_id=service.id)
except NotFound:
    endpoint = keystone.endpoints.create(region='RegionOne',
                                         service_id=service.id,
                                         publicurl=args.public_url,
                                         adminurl=args.admin_url,
                                         internalurl=args.internal_url)

print(endpoint)

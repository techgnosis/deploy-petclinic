#! /usr/bin/env bash

set -euo pipefail

uaa-cli target https://$TKGI_HOSTNAME:8443
uaa-cli get-client-credentials-token admin -s $TKGI_ADMIN_CLIENT_SECRET

uaa-cli create-user tanzu-gitops \
--email tanzu-gitops@notreal.com \
--password tanzu-gitops

uaa-cli create-user app-developer \
--email app-developer@notreal.com \
--password app-developer

uaa-cli add-member pks.clusters.manage tanzu-gitops
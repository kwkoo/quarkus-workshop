# Common
#
USERCOUNT=3

# Keycloak
#
PASSWORD=openshift

# Nexus
#
INFRA_PROJECT=lab-infra

# CodeReady Workspaces
#
CRW_PROJECT=openshift-workspaces

# Gitea
#
GIT_PROJECT=$INFRA_PROJECT
GIT_APP_NAME=gitea
GIT_PVC_SIZE=10Gi
GIT_ADMIN_USER=gitadmin
GIT_ADMIN_PASSWORD=mysecretgiteapassword

# Homeroom
#
HR_PROJECT=$INFRA_PROJECT

# Get a Username
#
GAU_PROJECT=$INFRA_PROJECT
GAU_ACCESS_TOKEN=openshift2021
GAU_ADMIN_PASSWORD=mysecretgaupassword
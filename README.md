# Quarkus Workshop

This workshop is based on the [ocp\_4\_6\_quarkus\_workshop](https://github.com/rhsgsa/ocp_4_6_quarkus_workshop) by [kahlai](https://github.com/kahlai).

This deploys on OpenShift 4.7.

This project installs and configures the following:

1. `nexus` - configured to mirror Red Hat maven repositories

1. gitea

1. CodeReady Workspaces operator

1. An instance of CodeReady Workspaces with OpenShift OAuth turned off, sleeping of idle workspaces turned off, and increased workspace memory limits

1. OpenShift projects for each user - each project is provisioned with a `settings.xml` secret that is mounted by the user workspace; the `settings.xml` configures the in-cluster `nexus` as a maven mirror

1. Create a keycloak user for every user (with the password `openshift`)

1. Create a Quarkus workspace for every user

1. Lab instructions using homeroom-dashboard

1. Get A Username


## Installation

To install,

1. Login to OpenShift as an admin user using `oc login`

1. Set the number of users to provision for in `config.sh`

1. Run `make deploy`

Once everything has been deployed, you can

* run `make crw` to open a browser to CodeReady Workspaces

* run `make password` to get the admin user's password

* run `make keycloak` to open a browser to keycloak

* run `make gitea` to open a browser to gitea

* run `make homeroom` to open a browser to the lab instructions

* run `make gau` to open a browser to get-a-username


## Uninstall

To uninstall, run `make clean`.
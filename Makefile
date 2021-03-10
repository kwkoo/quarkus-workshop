BASE:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: deploy clean crw keycloak password gitea homeroom gau

deploy:
	@$(BASE)/scripts/deploy-nexus
	@$(BASE)/scripts/deploy-gitea
	@$(BASE)/scripts/deploy-crw
	@$(BASE)/scripts/create-user-projects
	@$(BASE)/scripts/provision-crw-users
	@$(BASE)/scripts/deploy-homeroom
	@$(BASE)/scripts/deploy-get-a-username
	@echo "Done"

clean:
	-@$(BASE)/scripts/delete-workspaces
	-@$(BASE)/scripts/delete-keycloak-users
	-@$(BASE)/scripts/clean-user-projects
	-@$(BASE)/scripts/clean-crw
	-@$(BASE)/scripts/clean-get-a-username
	-@$(BASE)/scripts/clean-gitea
	-@$(BASE)/scripts/clean-homeroom
	-@$(BASE)/scripts/clean-nexus

crw:
	@open https://`oc get route/codeready -n openshift-workspaces -o jsonpath='{.spec.host}'`

keycloak:
	@open https://`oc get route/keycloak -n openshift-workspaces -o jsonpath='{.spec.host}'`

password:
	@echo "keycloak admin password: `oc get secret/che-identity-secret -n openshift-workspaces -o yaml | grep -v 'f:' | grep 'password:' | awk '{ print $$2 }' | base64 -d`"

gitea:
	@open http://`oc get route/gitea -n lab-infra -o jsonpath='{.spec.host}'`

homeroom:
	@open https://`oc get route/hosted-workshop-spawner -n lab-infra -o jsonpath='{.spec.host}'`

gau:
	@open https://`oc get route/get-a-username -n lab-infra -o jsonpath='{.spec.host}'`

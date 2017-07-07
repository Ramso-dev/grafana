Keycloak config:
- set Keycloak OAuth data in custom.ini file
- set grafana openshift port (3000) in custom.ini file
- set grafana openshift url for redirect in custom.ini file
- set grafana redirect url in keycloak, this should be the grafana openshift url from the custom.ini (see Keycloak_grafanaconfig.png)
- For redirect to work it is neccessary a secured route in openshift (https url), otherwise browser will stop it

*If keycloak user is not created in grafana, the Grafana OAuth login will return an Internal Server Error. (cause sign up is in custom.ini deactivated). So in order to work the user must be created manually or using grafana API, or activate the ign up.


Grafana:

Datasource:
- The Name have to be the same than in the Dashboard JSON. Otherwise wont work.
- I had the problem that the direct access returned Unknown Error since I used https for grafana url. Workaround is to select proxy access and works again. See: https://groups.io/g/grafana/topic/144057
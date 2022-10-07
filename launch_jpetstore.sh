# Lancer toutes les applications du projet rapidement
# Je considère que toutes les applications suivent la même notation que ceux indiquer dans le reste du README, mais n'hésiter pas à changer selon votre configuration
# Dans notre cas : Les agents Java sont dans ~/monitor-agents/
# Les programmes pour ELK sont dans ~/monitor/
# L'application JPetStore (les différentes instances) sont dans ~/apps/
nohup java -javaagent:/home/ldumay/monitor-agents/elastic-apm-agent-1.29.0.jar -Delastic.apm.service_name=JpetStore_1 -Delastic.apm.server_url='http://172.16.202.151:8200' -jar ~/apps/jpetstore_1/target/mybatis-spring-boot-jpetstore-2.0.0-SNAPSHOT.jar > ~/apps/logs/jpetstore_1.logs &
nohup java -javaagent:/home/ldumay/monitor-agents/elastic-apm-agent-1.29.0.jar -Delastic.apm.service_name=jpetstore_2 -Delastic.apm.server_url='http://172.16.202.151:8200' -jar ~/apps/jpetstore_2/target/mybatis-spring-boot-jpetstore-2.0.0-SNAPSHOT.jar > ~/apps/logs/jpetstore_2.logs &
# Aide: les applications JPetStore sont lancés avec nohup, qui empeche la fermeture de l'application lors de la fermeture de la session utilisateur
# Lancer ElasticSearch
cd ~/monitor/elasticsearch-7.16.3/ && { ./bin/elasticsearch > monitor/logs/elasticsearch.logs & } ;
# Lancer Kibana
cd ~/monitor/kibana-7.16.3-linux-x86_64/ && { ./bin/kibana > monitor/logs/kibana.logs & } ;
# Lancer APM Serveur
# Note : APM Serveur m'a ignoré la redirection des logs, je vais voir comment corriger ça ...
cd ~/monitor/apm-server-7.16.3-linux-x86_64/ && { ./apm-server -e > monitor/logs/apm_server.logs & } ;
# On revient dans le dossier utilisateur
cd ~

echo "[ENTRANDO RAIZ customers-app PARA COMPILAR PROJETO]"

mvn clean install;

echo "[AGUARDANDO 3 Segundos]"
sleep 3;

echo "[REMOVENDO CONTAINERS ANTIGOS - customers_db, customers_app_back]"
docker rm -f customers_db customers_app_back;

echo "[AGUARDANDO 1 Segundo]"
sleep 1;

#echo "[DELETANDO VOLUMES ANTIGOS]"
#docker volume prune;
#
#echo "[AGUARDANDO 2 Segundos]"
#sleep 2;
#
#
#echo "[DELETANDO REDES ANTIGAS]"
#docker network prune;
#
#echo "[AGUARDANDO 3 Segundos]"
#sleep 3;

echo "[FAZENDO BUILD DO BANCO E PROJETO PARA OS CONTAINERS]"
docker-compose up -d --build;

echo "[PROCESSO DE BUILD TERMINADO COM SUCESSO!!]"
docker ps -a;

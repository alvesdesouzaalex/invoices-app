echo "[Compilando projeto]"
mvn clean install;

echo "[AGUARDANDO 1 Segundo]"
sleep 1;

echo "[ENTRANDO DOCKER]"

cd docker;

echo "[AGUARDANDO 1 Segundos]"
sleep 1;

echo "[REMOVENDO CONTAINERS ANTIGOS - invoices_app_db]"
docker rm -f invoices_db_local;

echo "[AGUARDANDO 1 Segundo]"
sleep 1;

#echo "[DELETANDO VOLUMES ANTIGOS]"
#docker volume prune;
#
#echo "[AGUARDANDO 2 Segundos]"
#sleep 2;
#
#echo "[DELETANDO REDES ANTIGAS]"
#docker network prune;
#
#echo "[AGUARDANDO 3 Segundos]"
#sleep 3;

echo "[FAZENDO BUILD DO BANCO E PROJETO PARA OS CONTAINERS]"
docker-compose up -d;

echo "[PROCESSO DE BUILD TERMINADO COM SUCESSO!!]"
docker ps -a;

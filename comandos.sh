##CREAR UNA INSTANCIA DE MYSQL

gcloud sql instances create mysql-instance-source \
--database-version=MYSQL_8_0 \
--tier=db-g1-small \
--region=us-central1 \
--root-password=packt123 \
--availability-type=zonal \
--storage-size=10GB \
--storage-type=HDD


##EXPORTAR DE CLOUD SQL A GCS
##LA SA DE CLOUD-SQL DEBE TENER PERMISOS DE R/W A GCS

gcloud sql export csv mysql-instance-source \
gs://$bucket_name/mysql_export/stations/20180101/stations.csv \
--database=apps_db \
--offload \
--query='SELECT * FROM stations WHERE station_id <= 200;'

gcloud sql export csv mysql-instance-source \
gs://$bucket_name/mysql_export/stations/20180102/stations.csv \
--database=apps_db \
--offload \
--query='SELECT * FROM stations WHERE station_id <= 400;'

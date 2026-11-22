# Une rabbit2 al cluster de rabbit1 y muestra el estado del cluster.
# Uso: .\cluster-unir.ps1
docker exec rabbit2 rabbitmqctl stop_app
docker exec rabbit2 rabbitmqctl reset
docker exec rabbit2 rabbitmqctl join_cluster rabbit@rabbit1
docker exec rabbit2 rabbitmqctl start_app
docker exec rabbit1 rabbitmqctl cluster_status
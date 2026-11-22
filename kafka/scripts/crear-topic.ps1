# Crea un topic con particiones y replicas, y min.insync.replicas=2.
# Uso:  .\crear-topic.ps1 -Nombre pedidos.demo -Particiones 3 -Replicas 3
param(
    [Parameter(Mandatory = $true)][string]$Nombre,
    [int]$Particiones = 3,
    [int]$Replicas = 3
)

docker exec kafka1 kafka-topics --bootstrap-server kafka1:29092 --create `
    --topic $Nombre --partitions $Particiones --replication-factor $Replicas `
    --config min.insync.replicas=2
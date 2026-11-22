# Lista los topics, o describe uno (particiones, lideres, replicas e ISR).
# Uso:  .\topics.ps1                       -> lista los topics
#       .\topics.ps1 -Nombre pedidos.eventos
param([string]$Nombre)

$bootstrap = "kafka1:29092"
if ($Nombre) {
    docker exec kafka1 kafka-topics --bootstrap-server $bootstrap --describe --topic $Nombre
} else {
    docker exec kafka1 kafka-topics --bootstrap-server $bootstrap --list
}
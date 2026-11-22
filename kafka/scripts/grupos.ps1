# Lista los grupos de consumidores, o muestra los offsets y el lag de uno.
# Uso:  .\grupos.ps1                      -> lista los grupos
#       .\grupos.ps1 -Grupo notificaciones
param([string]$Grupo)

$bootstrap = "kafka1:29092"
if ($Grupo) {
    docker exec kafka1 kafka-consumer-groups --bootstrap-server $bootstrap --describe --group $Grupo
} else {
    docker exec kafka1 kafka-consumer-groups --bootstrap-server $bootstrap --list
}
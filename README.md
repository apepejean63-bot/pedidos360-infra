# Pedidos360 - Infraestructura

Contenedores de mensajeria para el sistema Pedidos360.

## kafka/
- `docker-compose.kafka.yml`: 3 ZooKeeper y 3 brokers (Confluent 7.9.0, Kafka 3.9). Topics `pedidos.eventos` y `pedidos.estado` con 3 particiones y 3 replicas, `min.insync.replicas=2`.
- `docker-compose.kafka-ui.yml`: Kafka UI en `http://127.0.0.1:8090`.
- `scripts/`: `topics.ps1`, `crear-topic.ps1` y `grupos.ps1` (topics, creacion de topics, grupos y lag).

## rabbitmq/
- `docker-compose.rabbitmq.yml`: dos nodos (`rabbit1` en 5672/15672 y `rabbit2` en 5673/15673).
- `scripts/cluster-unir.ps1`: une `rabbit2` al cluster de `rabbit1`.
- `scripts/politica-ha.ps1`: politica `ha-todas` que replica las colas en los dos nodos.

Uso: levantar el compose, esperar a que ambos nodos terminen de arrancar (`docker exec rabbit1 rabbitmq-diagnostics check_running`) y ejecutar los dos scripts.
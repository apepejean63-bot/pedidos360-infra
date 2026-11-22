# Crea la politica que replica todas las colas en los dos nodos del cluster.
# Uso: .\politica-ha.ps1
param(
    [string]$Usuario = "admin",
    [string]$Clave = "admin123",
    [string]$Api = "http://127.0.0.1:15672"
)

$credencial = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("${Usuario}:${Clave}"))
$cabeceras = @{ Authorization = "Basic $credencial" }
$cuerpo = @{
    pattern    = ".*"
    "apply-to" = "queues"
    definition = @{ "ha-mode" = "all"; "ha-sync-mode" = "automatic" }
    priority   = 0
} | ConvertTo-Json -Depth 5

Invoke-RestMethod -Method Put -Uri "$Api/api/policies/%2F/ha-todas" -Headers $cabeceras -ContentType "application/json" -Body $cuerpo
Write-Host "Politica ha-todas creada."
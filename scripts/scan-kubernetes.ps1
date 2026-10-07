$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$Manifest = Join-Path $ProjectRoot "k8s\deployment.yaml"

if (-not (Test-Path $Manifest)) {
    throw "Kubernetes manifest not found: $Manifest"
}

docker cp $Manifest security-lab:/tmp/deployment.yaml
try {
    docker exec security-lab trivy config /tmp/deployment.yaml
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}
finally {
    docker exec security-lab rm -f /tmp/deployment.yaml | Out-Null
}

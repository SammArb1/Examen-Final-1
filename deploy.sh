#!/bin/bash

AWS_REGION="us-east-2"
AWS_ACCOUNT_ID="848504403855"
REPO_NAME="lambda_final_repo"

ECR_URL="848504403855.dkr.ecr.us-east-2.amazonaws.com/lambda_final_repo:latest"

echo "=== 1. Autenticando Docker con AWS ECR ==="
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 848504403855.dkr.ecr.us-east-2.amazonaws.com

echo "=== 2. Construyendo la imagen Docker (Formato compatible Lambda) ==="
docker build --provenance=false -t lambda_final_repo:latest .

echo "=== 3. Asignando etiquetas (Tags) ==="
docker tag lambda_final_repo:latest 848504403855.dkr.ecr.us-east-2.amazonaws.com/lambda_final_repo:latest

echo "=== 4. Subiendo la imagen al Registry de AWS (Push) ==="
docker push 848504403855.dkr.ecr.us-east-2.amazonaws.com/lambda_final_repo:latest

echo "=== ¡Proceso completado con éxito! ==="
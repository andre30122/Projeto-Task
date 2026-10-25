# Cria a base leve do sistema
FROM python:3.11-slim

# Define a pasta central de operações
WORKDIR /app

# Garante o buffer imediato de logs
ENV PYTHONUNBUFFERED=1

# Injeta o código local no container
COPY src/ /app/src/

# O gatilho que dispara a execução
CMD ["python", "src/main.py"]
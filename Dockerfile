# Cria a base leve do sistema
FROM python:3.11-slim

# Define a pasta central de operações
WORKDIR /app

# Garante o buffer imediato de logs
ENV PYTHONUNBUFFERED=1

# Copia todos os ficheiros do projeto para o container
COPY . .

# O gatilho que dispara a execução do main.py na pasta src
CMD ["python", "src/main.py"]
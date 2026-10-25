# TaskTracker 🚀

Aplicação de gestão de tarefas em linha de comando desenvolvida em Python e conteinerizada com Docker.

## 📌 Autor
- **Nome:** André Nogueira de Alcântara
- **Curso:** Análise e Desenvolvimento de Sistemas
- **Disciplina:** Bootcamp II

## 📁 Estrutura do Repositório
- `README.md`: Documentação principal do projeto.
- `.gitignore`: Regras para ignorar ficheiros temporários.
- `Dockerfile`: Configuração para construção da imagem Docker da aplicação.
- `docker-compose.yml`: Orquestração para execução simplificada e interativa do container.
- `docs/`: Documentação e planeamento lógico da Fase 1.
- `src/`: Código-fonte principal da aplicação (`main.py`).

## 🛠️ Como Executar com Docker (Recomendado)

### Pré-requisitos
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado e em execução.

### Passos para Execução
1. Abra o terminal na pasta raiz do projeto.
2. Construa a imagem Docker da aplicação:
   ```bash
   docker build -t tasktracker:latest .
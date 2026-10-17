import os

# Base de dados em memória e controle de ID
tarefas = []
proximo_id = 1

def limpar_tela():
    # Limpa o terminal (funciona no Windows e no Linux/Mac)
    os.system('cls' if os.name == 'nt' else 'clear')

def cadastrar_tarefa():
    global proximo_id
    limpar_tela()
    print("--- CADASTRAR NOVA TAREFA ---")
    
    # 1 e 2. Solicitar e Validar Título (Regra 1)
    while True:
        titulo = input("Título da Tarefa: ").strip()
        if titulo != "":
            break
        print("Erro: O título não pode ser vazio!\n")

    # 3. Solicitar Descrição
    descricao = input("Descrição da Tarefa: ").strip()

    # 4 e 5. Solicitar e Validar Prioridade (Regra 2)
    prioridades_validas = ["Alta", "Média", "Baixa", "Media"]
    while True:
        prioridade = input("Prioridade (Alta, Média, Baixa): ").strip().capitalize()
        if prioridade in prioridades_validas:
            # Padronizando caso o usuário digite sem acento
            if prioridade == "Media": prioridade = "Média"
            break
        print("Erro: Opção inválida! Escolha apenas entre Alta, Média ou Baixa.\n")

    # 6. Solicitar Data Limite
    data_limite = input("Data Limite (DD/MM/AAAA): ").strip()

    # 7. Gerar ID e Status (Regras 3 e 4)
    nova_tarefa = {
        "id": proximo_id,
        "titulo": titulo,
        "descricao": descricao,
        "prioridade": prioridade,
        "prazo": data_limite,
        "status": "Pendente"
    }

    # 8. Salvar Tarefa
    tarefas.append(nova_tarefa)
    proximo_id += 1

    # 9. Exibir Sucesso
    print("\nTarefa cadastrada com sucesso!")
    input("Pressione ENTER para voltar ao menu...")

def listar_tarefas():
    limpar_tela()
    print("--- LISTA DE TAREFAS ---")
    
    # 2 e 3. Verificar Existência
    if len(tarefas) == 0:
        print("Nenhuma tarefa cadastrada até o momento.")
    else:
        # 4 e 5. Percorrer a lista e exibir tarefas
        pendentes = 0
        concluidas = 0
        
        for t in tarefas:
            print(f"[{t['id']}] {t['titulo']} - Prioridade: {t['prioridade']} - Prazo: {t['prazo']} - Status: {t['status']}")
            if t['status'] == "Pendente":
                pendentes += 1
            else:
                concluidas += 1
                
        # 6. Exibir Resumo/Estatísticas
        print("-" * 30)
        print(f"Resumo: {pendentes} Pendentes | {concluidas} Concluídas | Total: {len(tarefas)}")
        
    print("\n")

def concluir_tarefa():
    limpar_tela()
    print("--- CONCLUIR TAREFA ---")
    
    # 1. Listar Tarefas
    listar_tarefas()
    
    if len(tarefas) == 0:
        input("Pressione ENTER para voltar ao menu...")
        return

    # 2. Pedir ID
    try:
        id_escolhido = int(input("Digite o ID da tarefa que deseja concluir: "))
    except ValueError:
        print("Erro: Por favor, digite um número válido.")
        input("Pressione ENTER para voltar ao menu...")
        return

    # 3 e 4. Buscar Tarefa e Alterar Status
    tarefa_encontrada = False
    for t in tarefas:
        if t['id'] == id_escolhido:
            tarefa_encontrada = True
            if t['status'] == "Concluída":
                print("Aviso: Esta tarefa já estava concluída.")
            else:
                t['status'] = "Concluída"
                print(f"\nTarefa #{id_escolhido} marcada como Concluída com sucesso!")
            break
            
    # 5. Se Não Encontrar o ID
    if not tarefa_encontrada:
        print("\nErro: Tarefa com o ID informado não foi encontrada.")
        
    input("Pressione ENTER para voltar ao menu...")

def remover_tarefa():
    # Criei esta função extra pois você mencionou a opção "Remover" no item 2.2 do seu documento
    limpar_tela()
    print("--- REMOVER TAREFA ---")
    listar_tarefas()
    
    if len(tarefas) == 0:
        input("Pressione ENTER para voltar ao menu...")
        return

    try:
        id_escolhido = int(input("Digite o ID da tarefa que deseja remover: "))
    except ValueError:
        print("Erro: Por favor, digite um número válido.")
        input("Pressione ENTER para voltar ao menu...")
        return

    for i in range(len(tarefas)):
        if tarefas[i]['id'] == id_escolhido:
            tarefa_removida = tarefas.pop(i)
            print(f"\nTarefa '{tarefa_removida['titulo']}' removida com sucesso!")
            input("Pressione ENTER para voltar ao menu...")
            return
            
    print("\nErro: Tarefa com o ID informado não foi encontrada.")
    input("Pressione ENTER para voltar ao menu...")

def menu_principal():
    while True:
        limpar_tela()
        print("==============================")
        print("       TASKTRACKER v1.0       ")
        print("==============================")
        print("1. Cadastrar nova tarefa")
        print("2. Listar tarefas")
        print("3. Marcar tarefa como Concluída")
        print("4. Remover tarefa")
        print("5. Sair")
        print("==============================")
        
        opcao = input("Escolha uma opção: ").strip()
        
        if opcao == '1':
            cadastrar_tarefa()
        elif opcao == '2':
            listar_tarefas()
            input("Pressione ENTER para voltar ao menu...")
        elif opcao == '3':
            concluir_tarefa()
        elif opcao == '4':
            remover_tarefa()
        elif opcao == '5':
            print("Encerrando o TaskTracker... Até logo!")
            break
        else:
            print("Opção inválida! Tente novamente.")
            input("Pressione ENTER para continuar...")

# Ponto de entrada do programa
if __name__ == "__main__":
    menu_principal()
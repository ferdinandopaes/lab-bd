# Laboratório de Banco de Dados - Quinto ADS

Bem-vindo ao ambiente oficial das aulas de Banco de Dados.

Este repositório foi organizado para que você consiga subir o ambiente rapidamente e iniciar as atividades práticas sem complicação.

Aqui você encontra dois guias principais:

---

## 🐳 1️⃣ Subir o MySQL com Docker

Guia completo explicando:

* O que é o container
* Como subir o MySQL
* Como parar e reiniciar
* Como resetar o ambiente
* Como verificar se está funcionando

👉 Acesse aqui: **[DOCKER.md](DOCKER.md)**

---

## 🗄 2️⃣ Importar o Banco e Executar os Scripts SQL

Guia completo explicando:

* O que contém o arquivo SQL
* Como importar no MySQL Workbench
* Como importar via terminal
* Como validar se deu certo
* Exemplos de consultas para testar

👉 Acesse aqui: **[SQL.md](SQL.md)**

---

# 🚀 Fluxo Rápido (Resumo para começar em 2 minutos)

1. Siga o passo a passo em **DOCKER.md** para subir o container
2. Depois importe o banco seguindo **SQL.md**
3. Abra o Workbench
4. Execute:

SELECT * FROM fornecedores;

Pronto. Ambiente funcionando.

---

# 🎯 Objetivo

Garantir que todos os alunos tenham:

* Mesmo ambiente
* Mesma versão do MySQL
* Mesmo banco
* Dados já carregados
* Zero dor de cabeça com instalação

---

# 💡 Dica Importante

Se algo der errado, pare tudo e recomece:

docker compose down -v
docker compose up -d

Depois reimporte o SQL.

Simples assim.

---

Bora praticar SQL. 💪

# 📦 Ambiente MySQL com Docker para Aulas de Banco de Dados

Este projeto utiliza **Docker Compose** para subir rapidamente um servidor MySQL 8.0 pronto para uso em atividades acadêmicas.

O objetivo é eliminar a necessidade de instalação manual do MySQL, permitindo que os alunos iniciem rapidamente as práticas de SQL.

---

# 🎯 Objetivo

Ao executar este ambiente, você terá:

* MySQL 8.0 rodando em container
* Banco de dados chamado `aula` criado automaticamente
* Usuário e senha configurados
* Persistência de dados (não perde ao reiniciar)
* Acesso via porta padrão `3306`

---

# 📋 Pré-requisitos

Antes de começar, instale:

## 1. Docker

Verifique se está instalado:

```bash
docker --version
```

Se não estiver instalado:
[https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

---

## 2. Docker Compose

Verifique:

```bash
docker compose version
```

---

# 📁 Estrutura do projeto

Arquivo:

```bash
docker-compose.yml
```

Conteúdo:

```yaml
services:
  db:
    image: mysql:8.0
    container_name: mysql_container
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: admin123456
      MYSQL_DATABASE: aula
      MYSQL_USER: ferdinando
      MYSQL_PASSWORD: admin123
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

volumes:
  mysql_data:
```

---

# 🔎 Explicação detalhada

## services

Define os containers que serão executados.

Aqui temos apenas um serviço chamado:

```yaml
db
```

Este é o servidor MySQL.

---

## image: mysql:8.0

Define a imagem oficial do MySQL versão 8.0.

Docker irá baixar automaticamente se não existir localmente.

---

## container_name: mysql_container

Define um nome fixo para o container.

Sem isso, o Docker criaria um nome aleatório.

Facilita comandos como:

```bash
docker logs mysql_container
docker exec -it mysql_container bash
```

---

## restart: always

Significa que o container sempre reiniciará automaticamente se:

* o Docker reiniciar
* o computador reiniciar
* o container parar por erro

---

## environment

Define variáveis de ambiente usadas pelo MySQL na inicialização.

```yaml
MYSQL_ROOT_PASSWORD: admin123456
```

Senha do usuário root (administrador).

---

```yaml
MYSQL_DATABASE: aula
```

Cria automaticamente um banco chamado:

```sql
aula
```

---

```yaml
MYSQL_USER: ferdinando
MYSQL_PASSWORD: admin123
```

Cria um usuário:

Usuário:

```
ferdinando
```

Senha:

```
admin123
```

Este usuário terá acesso ao banco `aula`.

---

## ports

```yaml
"3306:3306"
```

Formato:

```yaml
PORTA_DO_COMPUTADOR:PORTA_DO_CONTAINER
```

Permite acessar o MySQL através de:

```
localhost:3306
```

---

## volumes

```yaml
mysql_data:/var/lib/mysql
```

Isso garante persistência dos dados.

Sem volume, ao remover o container, todos os dados seriam perdidos.

Com volume, os dados ficam salvos.

---

## volumes (seção inferior)

```yaml
volumes:
  mysql_data:
```

Define o volume gerenciado pelo Docker.

---

# 🚀 Como subir o container

Abra o terminal na pasta onde está o arquivo:

```bash
docker-compose.yml
```

Execute:

```bash
docker compose up -d
```

ou

```bash
docker-compose up -d
```

---

## O que este comando faz

* baixa a imagem MySQL
* cria o container
* cria o banco
* cria o usuário
* inicia o servidor

---

# ✅ Verificar se está rodando

Execute:

```bash
docker ps
```

Você verá algo como:

```bash
mysql_container   mysql:8.0   Up   3306/tcp
```

---

# 🧪 Testar conexão via terminal

Execute:

```bash
docker exec -it mysql_container mysql -u root -p
```

Digite a senha:

```
admin123456
```

---

# 📊 Mostrar bancos existentes

Dentro do MySQL:

```sql
SHOW DATABASES;
```

Você verá:

```sql
aula
information_schema
mysql
performance_schema
sys
```

---

# 👨‍💻 Conectar via MySQL Workbench, DBeaver ou outro cliente

Use:

Host:

```
localhost
```

Porta:

```
3306
```

Banco:

```
aula
```

Usuário:

```
ferdinando
```

Senha:

```
admin123
```

---

# 🛑 Parar o container

```bash
docker compose down
```

---

# ▶️ Iniciar novamente

```bash
docker compose up -d
```

Os dados continuarão lá.

---

# 🧹 Resetar completamente o banco

ATENÇÃO: isso apaga todos os dados.

```bash
docker compose down -v
```

Depois:

```bash
docker compose up -d
```

---

# 📜 Ver logs

```bash
docker logs mysql_container
```

---

# 🧠 Comandos úteis

Entrar no container:

```bash
docker exec -it mysql_container bash
```

Entrar no MySQL:

```bash
docker exec -it mysql_container mysql -u ferdinando -p
```

---

# ⚡ Fluxo recomendado para alunos

Passo 1

Baixar o arquivo docker-compose.yml

Passo 2

Abrir terminal na pasta

Passo 3

Executar:

```bash
docker compose up -d
```

Passo 4

Abrir DBeaver ou MySQL Workbench

Passo 5

Conectar usando:

Host: localhost
Porta: 3306
Usuário: ferdinando
Senha: admin123
Banco: aula

Pronto. Ambiente pronto para uso.

---

# 🎯 Resultado

Agora cada aluno terá seu próprio servidor MySQL funcionando em menos de 1 minuto, sem instalar nada manualmente.

---

# 🚀 Vantagens

* rápido
* padronizado
* sem conflito entre versões
* fácil de resetar
* funciona em Windows, Linux e Mac

---

# 🧯 Solução de problemas

Se porta 3306 estiver ocupada:

Verifique:

```bash
lsof -i :3306
```

Ou altere no docker-compose:

```yaml
ports:
  - "3307:3306"
```

E conecte usando porta 3307.

---

# ✅ Conclusão

Este ambiente permite iniciar práticas de banco de dados de forma rápida, segura e padronizada usando Docker.

---

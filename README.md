# Desconto INSS

Este projeto tem por objetivo calcular o desconto de inss dos proponentes criados

## Requisitos

- Ruby 3.3.0
- Rails 7.1.3
- Node.js (última versão estável recomendada)
- Yarn (última versão estável recomendada)

## Configuração inicial

Antes de iniciar o projeto, certifique-se de ter o Ruby e o Rails instalados na versão especificada. Além disso, você precisará ter o Node.js e o Yarn instalados para gerenciar os pacotes JavaScript.

### Instalação do Node.js e Yarn

Você pode instalar o Node.js e o Yarn seguindo as instruções nos sites oficiais:

- [Node.js](https://nodejs.org/)
- [Yarn](https://yarnpkg.com/)

### Configurando o projeto

Após clonar o repositório, execute os seguintes comandos no diretório do projeto para configurar o ambiente de desenvolvimento:

```bash
# Instalar as dependências do Ruby
bundle install

# Instalar as dependências do JavaScript
yarn install

# Criar e configurar o banco de dados
rails db:create db:migrate db:seed

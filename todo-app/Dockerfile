# Use uma imagem base do Node.js
FROM node:16

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copie os arquivos necessários para o contêiner
COPY package.json ./
COPY src ./src
COPY spec ./spec

# Instale as dependências
RUN npm install

# Exponha a porta usada pela aplicação
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "run", "dev"]
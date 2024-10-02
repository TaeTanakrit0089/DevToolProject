FROM node:14

WORKDIR /app

COPY package*.json ./
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs
RUN npm install

COPY . .

EXPOSE 8083
CMD ["npm", "run", 'dev']
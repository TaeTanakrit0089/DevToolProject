FROM node:latest

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8083

CMD ["bash", "-c", "npm run dev"]
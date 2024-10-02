FROM node:latest

WORKDIR /app

COPY package*.json ./
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs 
    #npm                       # note this one
RUN npm install

COPY . .

EXPOSE 8083
CMD ["npm", "run", 'dev']
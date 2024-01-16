FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

ENV NODE_ENV=production
ENV PORT=5000
ENV DATABASE_URL=postgres://postgres:postgres@db:5432/bookstore_db

EXPOSE 5000

CMD ["npm", "start"]

FROM node:12.16.2-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install
RUN npm install -g @angular/cli@7.3.9

COPY . .

EXPOSE 4200

CMD ng serve --host 0.0.0.0
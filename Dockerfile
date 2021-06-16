FROM node:12.16.2-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install
RUN npm install -g @angular/cli@7.3.9

COPY . .

EXPOSE 4200

RUN npm run build

FROM nginx:1.17.1-alpine

COPY --from=build /app/dist/* /usr/share/nginx/html

CMD ng serve --host 0.0.0.0
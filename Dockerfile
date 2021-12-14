# build stage
FROM node:16.13.1-bullseye-slim as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:1.12-alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html

COPY prod.default.conf /etc/nginx/conf.d/default.conf

COPY ./Certs/simonislam.com.crt /usr/share/nginx/
COPY ./Certs/simonislam.com.key /usr/share/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
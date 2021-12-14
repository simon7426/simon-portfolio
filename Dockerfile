# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:1.12-alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html

COPY prod.default.conf /etc/nginx/conf.d/default.conf
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
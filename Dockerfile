# build stage
FROM node:16.13.1-bullseye-slim as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:1.21.5-alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html

COPY prod.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

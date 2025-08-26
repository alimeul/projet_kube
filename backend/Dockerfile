# Build
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# App
FROM node:18
LABEL org.opencontainers.image.source="https://github.com/alimeul2024/projet_kube"
WORKDIR /app

COPY --from=build /app .

EXPOSE ${PORT:-3000}
CMD ["node", "src/server.js"]

FROM node:20 AS build
ARG VITE_BACKEND_URL=https://automatic-potato-g4x45q7wqgwj3xv9-3000.app.github.dev/api/v1
WORKDIR /build
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx AS final
WORKDIR /usr/share/nginx/html
COPY --from=build /build/dist .

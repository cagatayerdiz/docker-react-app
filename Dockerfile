FROM node:alpine AS builder

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# prod files path: /app/build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/ngnix/html
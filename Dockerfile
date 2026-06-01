#FROM        node:20
#RUN         useradd -d /app roboshop
#USER        roboshop
#WORKDIR     /app
#COPY        package.json server.js /app/
#RUN         npm install
#ENTRYPOINT  ["node", "/app/server.js"]
#

# Stage 1 - Build
FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./

COPY server.js ./

# Stage 2 - Runtime
FROM node:20-alpine

RUN adduser -D -h /app roboshop

USER roboshop

WORKDIR /app

COPY --from=builder /app /app

CMD ["node", "server.js"]
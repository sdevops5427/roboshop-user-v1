FROM        node:20
RUN         useradd -d /app roboshop
USER        roboshop
WORKDIR     /app
COPY        package.json server.js /app/
RUN         npm install
ENTRYPOINT  ["node", "/app/server.js"]


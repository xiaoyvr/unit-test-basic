FROM node:4.1.1

RUN npm install -g grunt-cli
RUN npm install -g bower

RUN mkdir -p /opt/app-root
WORKDIR /opt/app-root

COPY package.json bower.json /opt/app-root/
RUN npm install
RUN bower install --allow-root

COPY . .

EXPOSE 8000

CMD ["grunt", "serve"]
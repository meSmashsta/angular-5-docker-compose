FROM node:8.16.2

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json /app/package.json
RUN npm cache clean --force
RUN npm config set user 0
RUN npm config set unsafe-perm true

RUN npm install
RUN npm install -g @angular/cli@1.6.6

COPY . /app
EXPOSE 4200 49153

CMD ng serve --host 0.0.0.0
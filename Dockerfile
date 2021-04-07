FROM node:12.22.1-alpine

WORKDIR /bot

COPY package*.json ./

RUN npm ci --silent

COPY . .

RUN npm run build \
  && npm prune --production \
  && npm cache clean --force

CMD ["npm", "start"]

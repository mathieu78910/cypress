FROM node:24-alpine3.22 AS builder

COPY . /app

WORKDIR /app

RUN npm install --production
RUN npm run build

FROM node:24-alpine3.22 AS next 

WORKDIR /app

COPY --from=builder /app/.next /app/package.json /app/node_modules /app/

EXPOSE 3000

COPY ./docker/next/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh


ENTRYPOINT ["entrypoint.sh"]
CMD ["npm", "run", "start"]

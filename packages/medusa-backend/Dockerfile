
FROM node:16.13.0 AS builder

RUN apt-get update && apt-get install -f -y postgresql-client

WORKDIR /app/backend

COPY manifests ./

RUN yarn install --immutable

FROM node:16.13.0
WORKDIR /app/backend

COPY --from=builder /app/backend ./
COPY packs ./

EXPOSE 9000

RUN yarn workspace @woodshop/backend migrate


FROM node:16.13.0 AS builder

ENV NODE_ENV production
RUN apt-get update && apt-get install -f -y postgresql-client

WORKDIR /workspace
COPY manifests ./

RUN yarn install --immutable

FROM node:16.13.0

WORKDIR /workspace
COPY --from=builder /workspace ./
COPY packs ./

EXPOSE 9000

RUN yarn workspace @woodshop/backend migrate
CMD yarn workspace @woodshop/backend start

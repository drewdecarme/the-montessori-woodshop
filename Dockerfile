FROM node:16.13.0 as builder

WORKDIR /app/admin

# COpy the output to the public file
COPY packages/medusa-admin/public /app/admin/public

FROM nginx
EXPOSE 80
COPY --from=builder /app/admin/public /usr/share/nginx/html
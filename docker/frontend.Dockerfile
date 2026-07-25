# Multi-stage security-hardened Dockerfile for Frontend Static App
# Stage 1: Build stage
FROM node:20-alpine AS builder

WORKDIR /usr/src/app

COPY src/frontend/package*.json ./
RUN npm ci

COPY src/frontend/ ./
RUN npm run build

# Stage 2: Nginx Security Hardened Runtime
FROM nginxinc/nginx-unprivileged:alpine AS production

COPY --from=builder /usr/src/app/dist /usr/share/nginx/html

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

CMD ["nginx", "-g", "daemon off;"]

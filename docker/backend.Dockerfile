# Multi-stage security-hardened Dockerfile for Backend API
# Stage 1: Build stage
FROM node:20-alpine AS builder

WORKDIR /usr/src/app

COPY src/backend/package*.json ./
RUN npm ci --only=production

COPY src/backend/ ./

# Stage 2: Production Minimal Runtime Stage
FROM node:20-alpine AS production

# Enforce Security Principle of Least Privilege
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /usr/src/app

COPY --from=builder --chown=appuser:appgroup /usr/src/app ./

USER appuser

EXPOSE 5000

ENV NODE_ENV=production

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:5000/health || exit 1

CMD ["node", "server.js"]

# Use official Node.js image (Node 24 supports App Router)
FROM node:24-alpine AS builder

WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN yarn install

# Build production version
RUN yarn run build

# ======================
# Runtime image
FROM node:24-alpine AS runner

WORKDIR /app

# Copy build output and dependencies
COPY --from=builder /app/package.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

# Expose port 55001
EXPOSE 55001

# Set runtime port
ENV PORT=55001

# Start the application
CMD ["yarn", "start"]
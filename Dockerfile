# ======== Build Stage ========
# Use a lightweight Node.js base image for building
FROM node:24-alpine AS builder

# Set working directory
WORKDIR /app

# Copy dependency files first to leverage Docker layer caching
COPY package.json yarn.lock ./

# Install dependencies (includes both dev and prod)
RUN yarn install --frozen-lockfile --prefer-offline --production=true

# Copy the rest of the source code
COPY . .

# Build the Next.js app (uses next.config.ts with `output: "standalone"`)
RUN yarn build

# ======== Runtime Stage ========
# Use a fresh lightweight image for running the app
FROM node:24-alpine AS runner

# Set working directory
WORKDIR /app

# Copy the standalone server output (includes server.js and required node_modules)
COPY --from=builder /app/.next/standalone ./

# Copy static assets (public/ and .next/static/)
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/static ./.next/static

# Set environment variables
ENV NODE_ENV=production
ENV PORT=55001

# Expose the desired port
EXPOSE 55001

# Run the application using the generated server.js
CMD ["node", "server.js"]
FROM node:20-alpine

# Install build dependencies for native packages (canvas, sqlite3, etc.)
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    gcc \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    giflib-dev \
    pixman-dev \
    pkgconf \
    build-base \
    sqlite-dev

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install all dependencies (including devDependencies for native module building)
RUN npm install

# Copy application files
COPY . .

# Create account.dev.txt from account.txt if it doesn't exist
# This is needed because the code uses account.dev.txt in production/development mode
RUN if [ -f account.txt ] && [ ! -f account.dev.txt ]; then \
        cp account.txt account.dev.txt; \
    fi

# Expose port 5000 for the uptime server
EXPOSE 5000

# Start the bot
CMD ["npm", "start"]

# Use Node.js as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build the React app
RUN npm run build

# Install PM2 globally
RUN npm install -g pm2

EXPOSE 3009

# Start the app with PM2
CMD ["pm2-runtime", "start", "server.js"]


# Use Node.js image to build the React app
FROM node:20 as build

WORKDIR /app
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

# Use Nginx to serve the built React app
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


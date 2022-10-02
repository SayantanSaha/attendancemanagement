### STAGE 1: Building Stage ###
# Run it in the official NODE Image
FROM node:latest as builder
WORKDIR /app
COPY . .
# Setup the ENV
RUN npm install
# Build the Project
RUN npm run build --prod

### STAGE 2: Runtime Stage ###
FROM nginx:alpine
# Copy stuff from the previous Builder Stage
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html
# Expose the app on Port 80
EXPOSE 80

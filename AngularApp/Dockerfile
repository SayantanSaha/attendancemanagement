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

# Add Healthcheck to poll the app every 10 seconds
HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=10 \
CMD curl http://localhost

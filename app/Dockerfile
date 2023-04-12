# FROM node:17-slim

# # Create and change to the app directory.
# WORKDIR /usr/src/app

# # Copy application dependency manifests to the container image.
# # A wildcard is used to ensure both package.json AND package-lock.json are copied.
# # Copying this separately prevents re-running npm install on every code change.
# COPY package*.json ./

# # Install production dependencies.
# RUN npm install --only=production

# # Copy local code to the container image.
# COPY . ./

# # Run the web service on container startup.
# CMD [ "npm", "start" ]


# Stage 1: Build the application
FROM node:16-alpine as builder

WORKDIR /app

COPY package*.json ./
COPY styles.css ./
COPY index.html ./
COPY index.js ./

RUN npm install --production

# Stage 2: Create the production image
# Stage 2
FROM gcr.io/distroless/nodejs18

WORKDIR /app
COPY --from=builder /app /app

USER nonroot

CMD ["index.js"]
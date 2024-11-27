# Use a lightweight Node.js image
FROM node:19-alpine3.15

# Set working directory
WORKDIR /reddit-k8s

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Clean npm cache and install dependencies with legacy-peer-deps to resolve peer conflicts
RUN npm cache clean --force && \
    npm install --legacy-peer-deps

# Install @chakra-ui/system with legacy-peer-deps to avoid conflict
RUN npm install @chakra-ui/system --legacy-peer-deps

# Copy the entire application code to the container
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application in production mode
CMD ["npm", "run", "dev"]




#FROM node:19-alpine3.15

#WORKDIR /reddit-k8s

#COPY . .

#RUN npm install --legacy-peer-deps

#EXPOSE 3000

#CMD ["npm","run","dev"]

# Use a lightweight Node.js image
#FROM node:19-alpine3.15

# Set working directory
#WORKDIR /reddit-k8s

# Copy package.json and package-lock.json to the container
#COPY package*.json ./

# Install dependencies with legacy-peer-deps to resolve peer conflicts
#RUN npm install --legacy-peer-deps

# Copy the entire application code to the container
#COPY . .

# Expose the application port
#EXPOSE 3000

# Start the application in production mode
#CMD ["npm", "run", "dev"]







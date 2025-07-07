FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package files first for dependency installation
COPY package.json package-lock.json ./
COPY server/service-account.json /usr/src/app/server/
RUN npm install

# Now copy the rest of your application code
COPY . .

# Build the application
RUN npm run build

# Set the CMD to run your application when the container starts.
CMD ["npm", "start"]

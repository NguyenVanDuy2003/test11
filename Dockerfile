FROM node:18-alpine as builder

WORKDIR /usr/src/app/
USER root

# Copy all files from current directory to working dir in image
COPY package*.json ./
# install node modules and build assets

RUN npm install 

# Copy all files
COPY . .
USER root

RUN npm run build

EXPOSE 3001

# Run npm start script when container starts
CMD [ "npm", "start" ]
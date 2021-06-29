FROM node:14.17.1
ENV NODE_ENV=production
WORKDIR /reviews-service
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
COPY . /reviews-service
EXPOSE 3000
CMD ["node", "server/index.js"]

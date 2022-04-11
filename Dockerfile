#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines

FROM node:10-alpine

# Node.js comes with default user node: but still need [username]:[group] syntax, might be the same
RUN mkdir ./website && chown node:node ./website

WORKDIR ./website

USER node

# copy and run after switching working directory and user?
COPY package.json .

RUN npm install

# what does this do? still need to transfer ownership to everything?
COPY --chown=node:node . .

# don't necessarily need 8080/tcp like online sources say
EXPOSE 8080

CMD ["node", "app.js"]

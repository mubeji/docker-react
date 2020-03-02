
# This container is for production, we have 2 base 
# images alpin and nginx, i.e. a multistep build process

# Build phase
FROM node:alpine as builder 

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build 

# the build folder will be    /app/build
# and thats the only thing that will be copied
# to the image below



# Run phase
# new image

# 1, use nginx image a production server
FROM nginx

# Expose port for aws
EXPOSE 80
# 2, copy over the results of npm run build
# Means, copy  /app/build  from  builder above  to  /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html
# /usr/share/nginx/html is a folder inside nginx


# nginx starts by default we dont have to manually start it














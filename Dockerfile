#This is a sample Image 

# FROM ubuntu:18.04

#FROM alpine:3.6

# RUN apt-get update 

#RUN apt-get install –y nginx 


# CMD [“echo”,”Image created”] 


   
FROM node:16.14.0-alpine as build
RUN apk add --no-cache libc6-compat git python3 make g++



RUN yarn install --frozen-lockfile
RUN yarn build

FROM node:16.14.0-alpine as run

RUN yarn global add pm2@5.1.2

ENV NODE_ENV production
ENV PORT 3000
EXPOSE 3000

RUN addgroup -g 1001 -S nodejs
RUN adduser -S nextjs -u 1001
USER nextjs

CMD [“echo”,”Image created”] 
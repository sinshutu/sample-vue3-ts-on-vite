FROM node:18.6.0-slim

WORKDIR /app

ENV TZ Asia/Tokyo
ENV RUBYOPT -EUTF-8
ENV LANG ja_JP.UTF-8
ENV DEBCONF_NOWARNINGS yes

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -qq  \
    && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY package.json yarn.lock ./
RUN yarn install

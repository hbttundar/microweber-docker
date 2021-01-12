FROM alpine:latest
RUN apk add --update --no-cache \
    nasm  \
    bzip2 \
    bash  \
    bash-doc  \
    bash-completion  \
    npm  \
    autoconf \
    automake \
    libpng \
    libpng-dev \
    zlib \
    zlib-dev \
    libwebp \
    libwebp-dev \
    gifsicle \
    libjpeg-turbo-utils \
    optipng \
    gcc \
    g++ \
    make \
&& rm -rf /var/cache/apk/*
WORKDIR /app
#create www-data user and group
RUN addgroup -S www-data && adduser -S www-data -G www-data -h /app
COPY entrypoint.sh /usr/local/bin/
RUN chown www-data:www-data -R /app
RUN chmod +x /usr/local/bin/entrypoint.sh
CMD ["entrypoint.sh"]
#CMD tail -f /dev/null





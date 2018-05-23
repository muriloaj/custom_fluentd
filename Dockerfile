FROM fluent/fluentd:v0.12-onbuild
MAINTAINER YOUR_NAME <...@...>

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \

 # cutomize following instruction as you wish
 && sudo gem install  fluent-plugin-secure-forward \
 && sudo gem install  fluent-plugin-elasticsearch	 \ 
 #&& sudo gem install  elasticsearch	 \ 
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem

EXPOSE 24284 24224/tcp 24224/udp

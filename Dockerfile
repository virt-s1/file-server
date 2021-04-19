FROM quay.io/xiaofwan/nginx:1.19.10-alpine
LABEL maintainer="xiaofwan@redhat.com"

# deploy specific nginx configuration file
COPY nginx.conf /etc/nginx
COPY .htpasswd /etc/nginx

RUN rm -rf /usr/share/nginx/html && \
    ln -snf /www /usr/share/nginx/html && \
    chmod g+rwx /var/cache/nginx /var/run /var/log/nginx

EXPOSE 8081

VOLUME /www
# inspired from https://torstenwalter.de/openshift/nginx/2017/08/04/nginx-on-openshift.html

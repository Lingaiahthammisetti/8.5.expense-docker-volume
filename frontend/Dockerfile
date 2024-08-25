# FROM nginx
# RUN rm -rf /usr/share/nginx/html/index.html
# RUN rm -rf /etc/nginx/nginx.conf
# RUN rm -rf /etc/nginx/conf.d/default.conf

# COPY expense.conf /etc/nginx/nginx.conf
# COPY code/ /usr/share/nginx/html/


FROM nginx
RUN rm -rf /usr/share/nginx/html/index.html
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/cache/nginx/client_temp && \
        mkdir -p /var/cache/nginx/proxy_temp && \
        mkdir -p /var/cache/nginx/fastcgi_temp && \
        mkdir -p /var/cache/nginx/uwsgi_temp && \
        mkdir -p /var/cache/nginx/scgi_temp && \
       
        mkdir -R nginx:nginx /var/cache/nginx && \
        mkdir -R nginx:nginx /etc/nginx/ && \
        mkdir -R 755 /etc/nginx/ && \
        mkdir -R nginx:nginx /var/log/nginx 
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /run/nginx.pid

COPY expense.conf /etc/nginx/nginx.conf
COPY code/ /usr/share/nginx/html/
USER nginx
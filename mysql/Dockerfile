FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1 \
    MYSQL_USER=expense \
    MYSQL_PASSWORD=ExpenseApp@1 \
    MYSQL_DATABASE=transactions 
COPY scripts/*.sql /docker-entrypoint-initdb.d/

# we have created network called 
#$docker network create expense


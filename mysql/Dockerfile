# FROM mysql:8.0
# ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1 \
#     MYSQL_USER=expense \
#     MYSQL_PASSWORD=ExpenseApp@1 \
#     MYSQL_DATABASE=transactions 
# COPY scripts/*.sql /docker-entrypoint-initdb.d/

# we have created network called 
#$docker network create expense

FROM mysql:8.0
#not a human, only for system
RUN adduser -r expense
ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1 \
    MYSQL_USER=expense \
    MYSQL_PASSWORD=ExpenseApp@1 \
    MYSQL_DATABASE=transactions 
RUN chown -R expense:expense /var/lib/mysql /var/run/mysqld
COPY scripts/*.sql /docker-entrypoint-initdb.d/
#USER expense

# we have created network called 
#$docker network create expense







# ---------- Hari script------------------
# FROM mysql:8.0
# # Add initialization scripts
# COPY scripts/*.sql /docker-entrypoint-initdb.d/

# # Set environment variables
# ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1 \
#     MYSQL_USER=expense \
#     MYSQL_PASSWORD=ExpenseApp@1 \
#     MYSQL_DATABASE=transactions

# # Adjust permissions for the default MySQL user
# RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /docker-entrypoint-initdb.d

# # Use the default MySQL user
# USER mysql
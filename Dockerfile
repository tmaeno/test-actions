ARG VERSION=14

FROM postgres:${VERSION}

ARG VERSION

#ENV POSTGRESQL_USER postgres
#ENV POSTGRES_PASSWORD password

#RUN apt-get update \
#      && apt-get install -y postgresql-${VERSION}-cron \
#      postgresql-${VERSION}-partman procps \
#      && rm -rf /var/lib/apt/lists/*


#COPY ./etc/postgresql.conf /etc/postgresql/postgresql.conf

#RUN mkdir -p /docker-entrypoint-initdb.d/sqls

#COPY ./initdb/*.sh /docker-entrypoint-initdb.d/
#COPY ./initdb/sqls/* /docker-entrypoint-initdb.d/sqls/

RUN mkdir temp
RUN groupadd non-root-postgres-group
RUN useradd non-root-postgres-user --group non-root-postgres-group
RUN chown -R non-root-postgres-user:non-root-postgres-group /temp
RUN chmod 777 /temp
USER non-root-postgres

#CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
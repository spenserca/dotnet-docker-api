FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

# Install unzip
RUN apt-get update \
    && apt-get install unzip -y

ENV ACCEPT_EULA=Y
ENV DBNAME=dockerdb

# Install SQLPackage
RUN wget -progress=bar:force -q -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=873926 \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage

COPY ../DockerDb/bin/Debug/DockerDb.dacpac /tmp/db.dacpac

# Launch SQL Server, confirm startup is complete, deploy the DACPAC, then terminate SQL Server.
# See https://stackoverflow.com/a/51589787/488695
RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/sqlpackage/sqlpackage /a:Publish /tsn:. /tdn:${DBNAME} /tu:sa /tp:$SA_PASSWORD /sf:/tmp/db.dacpac \
    && rm /tmp/db.dacpac \
    && pkill sqlservr
FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

# Install unzip
RUN apt-get update \
    && apt-get install unzip -y

ENV SA_PASSWORD=D0ck3r!1337
ENV ACCEPT_EULA=Y
ENV DBNAME=dockerdb

# Install SQLPackage
RUN wget -progress=bar:force -q -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2157202 \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod a+x /opt/sqlpackage/sqlpackage

RUN /opt/sqlpackage/sqlpackage /Version


COPY ./bin/Debug/DockerDb.dacpac /tmp/db.dacpac


# Launch SQL Server, confirm startup is complete, deploy the DACPAC, then terminate SQL Server.
# See https://stackoverflow.com/a/51589787/488695
RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/sqlpackage/sqlpackage /a:Publish /tsn:. /tdn:${DBNAME} /tu:sa /tp:${SA_PASSWORD} /sf:/tmp/db.dacpac

# RUN /opt/sqlpackage/sqlpackage /Action:Publish /TargetServerName:localhost /TargetDatabaseName:${DBNAME} /TargetUser:sa /TargetPassword:${SA_PASSWORD} /SourceFile:/tmp/db.dacpac
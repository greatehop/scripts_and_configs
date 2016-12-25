#!/bin/bash

MYSQL_USER="root"
MYSQL_PASS="pass"
DAYS_ROTATE="+5"
EXCLUDE_DB="(information|performance)_schema|Database|mysql|test"
PATH_BACKUP="/opt/backups"
PATH_MYSQLDUMP=$(which mysqldump)
CUR_DATE=$(date +%d.%m.%Y)

mkdir -p ${PATH_BACKUP}

# dump and compress all database(s)
for DBNAME in $(mysql -u ${MYSQL_USER} -e "show databases" -p"${MYSQL_PASS}" | egrep -v "${EXCLUDE_DB}")
do
    echo ${DBNAME}
    PATH_DUMP="${PATH_BACKUP}/${DBNAME}_${CUR_DATE}.sql"
    ${PATH_MYSQLDUMP} -u ${MYSQL_USER} -p"${MYSQL_PASS}" ${DBNAME} > ${PATH_DUMP}
    gzip -f --best ${PATH_DUMP}
done

# delete old arch
find ${PATH_BACKUP} -name '*.sql.gz' -mtime ${DAYS_ROTATE} | xargs rm -rf

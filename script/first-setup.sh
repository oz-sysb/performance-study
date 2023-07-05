#!/usr/bin/env bash

set -eu

# prepare
echo "prepare insert csv file..."
gzip -dc ./script/insert.csv.gz > /tmp/insert.csv
echo "create table..."
mysql study < ./script/create_dummy.sql
echo "insert data..."

mysql study -v --local-infile=1 -e 'SET GLOBAL local_infile=on;
LOAD DATA LOCAL INFILE "/tmp/insert.csv"
INTO TABLE dummy
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 LINES (@id, @name, @comment)
SET name = @name, comment = @comment, created = NOW(), updated = NOW();'

rm -rf /tmp/insert.csv
echo "done."

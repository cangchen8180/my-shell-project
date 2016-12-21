#!/bin/bash

# shell 读取mysql数据库
# 用途：用于快速导出线上数据

MYSQL=`which mysql`
USER=root
PASSWORD=root
DATABASE=mysql
QUERY="select User, Host from user;"

# ---------------------- 读数据 ----------------------
result=`${MYSQL} -h127.0.0.1 -u${USER} -p${PASSWORD} -D ${DATABASE} -e "${QUERY}" --skip-column-names`
echo "---------------result------------------"

# ----------- 数据导出文件 -----------
echo "${result}" > result.txt
# 或
# ${MYSQL} -h127.0.0.1 -u${USER} -p${PASSWORD} -D ${DATABASE} -e "${QUERY}" --skip-column-names > result.txt


# ----------- echo使用注意 -----------
# 注意：echo "$result" 的时候一定要加上双引号，不然导出的数据会挤在一行
#echo ${result}
echo "${result}"

# ----------- 对每行字段分割 -----------
#echo ${result} | awk -F ' ' '{printf("user1=%s, user2=%s",$1, $2)}'

# ----------- 按行打印 -----------
echo "${result}" | while read row
do
    echo "the row = $row"
done
#!/bin/bash
echo '---> Init databases for Oro projects'

db_list=(
    'oro_crm'
    'oro_crm_test'
    'bap_standard'
    'bap_dev_test'
    'b2b_dev'
    'b2b_dev_test'
    'b2b_crm_dev'
    'b2b_crm_dev_test'
)

for db in ${db_list[@]}; do
    echo "Create database \`$db\`"
    echo "CREATE DATABASE IF NOT EXISTS \`$db\` ;" | "${mysql[@]}"

    echo "Setup permissions for \`$MYSQL_USER\` to database \`$db\`"
    echo "GRANT ALL ON \`$db\`.* TO '$MYSQL_USER'@'%' ;" | "${mysql[@]}"
done

echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"

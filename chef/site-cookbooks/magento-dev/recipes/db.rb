include_recipe "database::mysql"

mysql_connection = {
    :host     => "localhost",
    :username => "root",
    :password => node["mysql"]["server_root_password"]
}

# Create database
mysql_database node["magento_dev"]["db_name"] do
    connection mysql_connection
    action :create
end

# Create database user
mysql_database_user node["magento_dev"]["db_user"] do
    connection mysql_connection
    password node["magento_dev"]["db_pass"]
    database_name node["magento_dev"]["db_name"]
    host "%"
    privileges [:all]
    action :grant
end
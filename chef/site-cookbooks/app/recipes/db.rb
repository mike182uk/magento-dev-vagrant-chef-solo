include_recipe "database::mysql"

mysql_connection = {
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
}

# Create database
mysql_database node["app"]["db_name"] do
    connection mysql_connection
    action :create
end

# Create database user
mysql_database_user node["app"]["db_user"] do
    connection mysql_connection
    password node["app"]["db_pass"]
    database_name node["app"]["db_name"]
    privileges [:all]
    action :grant
end
#
# Cookbook Name:: base
# Recipe:: mysql
#

# Install the mysql2_gem
mysql2_chef_gem "default" do
  action :install
end

# Install and configure MySQL service
mysql_service "default" do
  port "3306"
  version "5.5"
  bind_address "0.0.0.0"
  initial_root_password "root"
  action [:create, :start]
end

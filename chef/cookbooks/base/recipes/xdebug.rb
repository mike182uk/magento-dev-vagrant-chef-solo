#
# Cookbook Name:: base
# Recipe:: xdebug
#

include_recipe "xdebug"

# Enable XDebug
execute "enable-xdebug" do
  command "php5enmod xdebug"
  only_if "which php5enmod"
end

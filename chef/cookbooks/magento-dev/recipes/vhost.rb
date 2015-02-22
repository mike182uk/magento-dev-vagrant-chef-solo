# Setup apache vhost
web_app node["magento_dev"]["app"]["name"] do
    server_name node["magento_dev"]["vhost"]["server_name"]
    server_alias node["magento_dev"]["vhost"]["server_alias"]
    docroot node["magento_dev"]["vhost"]["docroot"]
    template "vhost.erb"
    enable true
end
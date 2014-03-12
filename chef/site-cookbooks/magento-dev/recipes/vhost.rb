# Setup apache vhost
web_app node["magento_dev"]["app_name"] do
    server_name node["magento_dev"]["server_name"]
    docroot node["magento_dev"]["docroot"]
    template "vhost.erb"
    enable true
end
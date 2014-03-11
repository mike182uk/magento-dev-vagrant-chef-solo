# Setup apache vhost
web_app node["app"]["app_name"] do
    server_name node["app"]["server_name"]
    docroot node["app"]["docroot"]
    template "vhost.erb"
    enable true
end
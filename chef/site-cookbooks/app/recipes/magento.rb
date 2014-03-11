template "/home/vagrant/install-magento.sh" do
    source "install-magento.erb"
    mode 0755
    variables({
        :params => node["app"]
    })
end
template "#{node['php']['conf_dir']}/../apache2/php.ini" do
    source "php.ini.erb"
    variables({
        :directives => node["php"]["directives"]
    })
end
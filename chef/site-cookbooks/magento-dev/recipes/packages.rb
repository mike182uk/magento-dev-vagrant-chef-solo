pkgs = %w{ php5-curl php5-mcrypt php5-gd php-apc }

pkgs.each do |pkg|
    package pkg do
        action :install
    end
end

# Restart apache so it loads the PHP modules
service "apache2" do
    action :restart
end
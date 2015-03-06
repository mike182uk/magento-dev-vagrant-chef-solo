USE_PRECONFIGURED_LAMP_BOX = false

Vagrant.configure("2") do |config|
    # Virtualbox config
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    # Vagrant plugins config
    config.cache.scope = :box
    config.berkshelf.enabled = true
    config.hostsupdater.remove_on_suspend = true

    # Box
    if USE_PRECONFIGURED_LAMP_BOX
        config.vm.box = "lamp-vagrant-chef-solo"
        config.vm.box_url = "https://dl.dropboxusercontent.com/u/13070740/vagrant-base-boxes/lamp-vagrant-chef-solo.box"
    else
      config.vm.box = "ubuntu/trusty64"
      config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/trusty64"

      # Install the latest version of chef
      config.omnibus.chef_version = :latest
    end

    # Networking
    config.vm.network :private_network, ip: "10.10.10.2"
    config.vm.hostname = "www.magento.dev"

    # Synced folders
    config.vm.synced_folder "./", "/var/www/magento_dev", type: "nfs"

    # Provision via chef solo
    config.vm.provision :chef_solo do |chef|
        chef.add_recipe "apt"
        chef.add_recipe "vim"
        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_rewrite"
        chef.add_recipe "apache2::mod_alias"
        chef.add_recipe "apache2::mod_php5"
        chef.add_recipe "base::mysql"
        chef.add_recipe "php"
        chef.add_recipe "php::module_apc"
        chef.add_recipe "php::module_curl"
        chef.add_recipe "php::module_gd"
        chef.add_recipe "php::module_mcrypt"
        chef.add_recipe "php::module_mysql"
        chef.add_recipe "php::apache2"
        chef.add_recipe "base::xdebug"
        chef.add_recipe "magento-dev::vhost"
        chef.add_recipe "magento-dev::db"
        chef.add_recipe "magento-dev::n98-magerun-config"
        chef.add_recipe "magento-dev::installation-script"

        chef.json = {
            "php" => {
                "ext_conf_dir" => "/etc/php5/mods-available",
                "ini_settings" => {
                    "date.timezone" => "Europe/London",
                    "memory_limit" => "512M",
                    "safe_mode" => "0"
                }
            },
            "xdebug" => {
                "config_file" => "/etc/php5/mods-available/xdebug.ini",
                "directives" => {
                    "remote_autostart" => 1,
                    "remote_connect_back" => 1,
                    "remote_enable" => 1,
                    "remote_log" => "/tmp/xdebug-remote.log"
                }
            }
        }
    end
end

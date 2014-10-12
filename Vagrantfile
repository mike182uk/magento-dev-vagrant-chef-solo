USE_PRECONFIGURED_LAMP_BOX = false

Vagrant.configure("2") do |config|
    # Virtualbox config
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    # Vagrant plugins config
    config.cache.scope = :box
    config.omnibus.chef_version = :latest
    config.librarian_chef.cheffile_dir = "chef"
    config.hostsupdater.remove_on_suspend = true

    # Box
    if USE_PRECONFIGURED_LAMP_BOX
        config.vm.box = "lamp-vagrant-chef-solo"
        config.vm.box_url = "https://dl.dropboxusercontent.com/u/13070740/vagrant-base-boxes/lamp-vagrant-chef-solo.box"
    else
        config.vm.box = "precise64"
        config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    end

    # Networking
    config.vm.network :private_network, ip: "10.10.10.2"
    config.vm.hostname = "www.magento.dev"

    # Synced folders
    config.vm.synced_folder "./", "/var/www/magento_dev", type: "nfs"

    # Provision via chef solo
    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = [
            "chef/cookbooks",
            "chef/site-cookbooks"
        ]

        chef.add_recipe "apt"
        chef.add_recipe "git"
        chef.add_recipe "vim"
        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_rewrite"
        chef.add_recipe "apache2::mod_alias"
        chef.add_recipe "apache2::mod_php5"
        chef.add_recipe "mysql::server"
        chef.add_recipe "php"
        chef.add_recipe "php::module_apc"
        chef.add_recipe "php::module_curl"
        chef.add_recipe "php::module_gd"
        chef.add_recipe "php::module_mcrypt"
        chef.add_recipe "php::module_mysql"
        chef.add_recipe "php::apache2"
        chef.add_recipe "xdebug"
        chef.add_recipe "composer"
        chef.add_recipe "magento-dev::vhost"
        chef.add_recipe "magento-dev::db"
        chef.add_recipe "magento-dev::n98-magerun-config"
        chef.add_recipe "magento-dev::installation-script"

        chef.json = {
            :mysql => {
                :server_root_password => "root",
                :server_debian_password => "root",
                :server_repl_password => "root"
            },
            :php => {
                :ini_settings => {
                    "date.timezone" => "Europe/London",
                    "memory_limit" => "512M",
                    "safe_mode" => "0"
                }
            },
            :xdebug => {
                :remote_enable => 1,
                :remote_connect_back => 1
            }
        }
    end
end

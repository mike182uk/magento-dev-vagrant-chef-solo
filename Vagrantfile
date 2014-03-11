Vagrant.configure("2") do |config|
    # Vagrant plugins config
    if Vagrant.has_plugin?("vagrant-cachier")
        config.cache.scope = :box
    end

    if Vagrant.has_plugin?("vagrant-omnibus")
        config.omnibus.chef_version = :latest
    end

    if Vagrant.has_plugin?("vagrant-librarian-chef")
        config.librarian_chef.cheffile_dir = "chef"
    end

    # Box
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Networking
    config.vm.network :private_network, ip: "33.33.33.10"

    # Synced folders
    config.vm.synced_folder "./", "/var/www", type: "nfs"

    # Provision via chef solo
    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = [
            "chef/cookbooks",
            "chef/site-cookbooks"
        ]

        chef.add_recipe "apt"
        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_rewrite"
        chef.add_recipe "apache2::mod_alias"
        chef.add_recipe "mysql::server"
        chef.add_recipe "php"
        chef.add_recipe "php::module_mysql"
        chef.add_recipe "apache2::mod_php5"
        chef.add_recipe "app::vhost"
        chef.add_recipe "app::db"
        chef.add_recipe "app::magento"

        chef.json = {
            :mysql => {
                :server_root_password => "root",
                :server_debian_password => "root",
                :server_repl_password => "root",
                :mysql_bin => "/usr/bin/mysql"
            },
            :php => {
                :directives => {
                    "date.timezone" => "Europe/London"
                }
            }
        }
    end
end
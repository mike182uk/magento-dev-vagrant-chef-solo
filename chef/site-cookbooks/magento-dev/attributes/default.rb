# app attributes
default['magento_dev']['app']['name'] = 'magento_dev'
default['magento_dev']['app']['app_path'] = '/var/www/magento_dev'
default['magento_dev']['app']['magento_path'] = '/var/www/magento_dev/magento'
default['magento_dev']['app']['base_url'] = 'www.magento.dev'
default['magento_dev']['app']['magento_version'] = '1.8.1.0'

# vhost attributes
default['magento_dev']['vhost']['server_name'] = default['magento_dev']['app']['base_url']
default['magento_dev']['vhost']['server_alias'] = default['magento_dev']['app']['base_url'].gsub('www', '')
default['magento_dev']['vhost']['docroot'] = default['magento_dev']['app']['magento_path']

# db attribtues
default['magento_dev']['db']['name'] = 'magentodb'
default['magento_dev']['db']['user'] = 'magento_user'
default['magento_dev']['db']['pass'] = 'magento_pass'
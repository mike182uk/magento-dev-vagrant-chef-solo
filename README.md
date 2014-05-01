# Magento dev box with Vagrant and Chef Solo

Development box configured to run Magento CE.

- Ubuntu 12.04 LTS
- All Magento CE [required PHP extensions](http://magento.com/resources/system-requirements) installed:
    - PDO_MySQL
    - simplexml
    - mcrypt
    - hash
    - GD
    - Dom
    - iconv
    - curl
    - SOAP
- Other useful packages installed:
    - git
    - vim
- Apache virtual host + MySQL database setup
    - access via `www.magento.dev` on the host machine
    - database details:
        - **database:** magento
        - **user:** magento
        - **password:** magento
    - database can be accessed from the host machine:
        - **host:** 10.10.10.2
        - use user + password above
    - root user for the database is:
        - **user:** root
        - **password:** root
- Composer installed and available globally
    - Sample `composer.json` includes:
        - QA + static analysis tools (PHPUnit, PHP_CodeSniffer etc.)
        - misc magento dev tools (n98-magerun etc.)
- XDebug installed and setup to allow remote debugging
    - To remote debug use the following values in your ide / debugger:
        - **host:** 10.10.10.2
        - **remote port:** 9000
        - **ide key:** magento-dev
- Includes script to install **Magento CE 1.8.1.0** + sample data

## Prerequisites

- A Ruby environment with the following Gems installed:

    - [Bundler](http://bundler.io/)

- [Virtualbox](https://www.virtualbox.org/)

- [Vagrant](http://www.vagrantup.com/) >=1.5 with the following plugins installed:

    - [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)
    - [vagrant-ombnibus](https://github.com/schisamo/vagrant-omnibus)
    - [vagrant-librarian-chef](https://github.com/jimmycuadra/vagrant-librarian-chef)
    - [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)
    - [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)

    ```bash
    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-omnibus
    vagrant plugin install vagrant-libraian-chef
    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-hostsupdater
    ```

## Usage

Install required Ruby Gems:

```bash
bundle install
```

Setup and provision the box:

```bash
vagrant up
```

Install Magento CE 1.8.1.0 + sample data

```bash
vagrant ssh -c "~/install-magento.sh"
```

Navigate to `http://www.magento.dev` to finish setting up Magento.

## Notes

I have only tested this on OS X (10.9). In theory it should work on most operating systems, although Windows will probably have a problem using NFS for synced folders.
See NFS alternatives [here](https://docs.vagrantup.com/v2/synced-folders/basic_usage.html).
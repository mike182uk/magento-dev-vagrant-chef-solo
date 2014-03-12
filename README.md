# Magento dev box with Vagrant and Chef Solo

Development box configured to run Magento CE.

- Ubuntu 12.04
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
- Apache virtual host + MySQL database setup
	- access via `www.magento.dev` on the host machine
	- database details:
		- **database:** magento
		- **user:** magento
		- **password:** magento
- Includes script to install **Magento CE 1.8.1.0** + sample data

## Prerequisites

1. A Ruby environment with the following Gems installed:

	- [Bundler](http://bundler.io/)

2. [Virtualbox](https://www.virtualbox.org/)

3. [Vagrant](http://www.vagrantup.com/) >=1.5 with the following plugins installed:

	- [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)
	- [vagrant-ombnibus](https://github.com/schisamo/vagrant-omnibus)
	- [vagrant-librarian-chef](https://github.com/jimmycuadra/vagrant-librarian-chef)
	- [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)
	- [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)

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

I have only tested this on OS X (10.9). In theory it should work on most operating systems, although i have a feeling Windows will have a problem using NFS for the synced folders.
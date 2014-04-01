##The Box

Creates a PHP, MySQL & nginx developent environment using Vagrant and imports a dev db copy into a newly created database

##Features

* MySQL
* PHP
* PHP-FPM
* PHP-APC
* Nginx
* Memcached

##Setup

* cd to your project's webroot
* put your development db copy at db/dev_db.sql

``` sh
git submodule add git@github.com:VaidasGaurilcikas/thebox.git
git submodule init
git submodule update
cd thebox
git submodule init
cd ..
cp thebox/Vagrantfile .
vagrant up
```



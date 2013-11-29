class thebox::php_fpm inherits thebox::php {
    php::fpm::pool { 'www':
        user  => "vagrant",
        group => "vagrant"
    }
}
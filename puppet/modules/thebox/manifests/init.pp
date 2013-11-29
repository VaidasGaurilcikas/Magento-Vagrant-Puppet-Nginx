class thebox() {

    host { "box.localhost":
        ip => "127.0.0.1"
    }

    include thebox::nginx
    include thebox::mysql
    include thebox::php
    include thebox::php_fpm
    include thebox::apc
    include thebox::n98magerun

    class { "memcached":
       memcached_port => '11211',
       maxconn        => '50',
       listen_address => '127.0.0.1',
       logfile        => '/var/log/memcached.log',
    }



}
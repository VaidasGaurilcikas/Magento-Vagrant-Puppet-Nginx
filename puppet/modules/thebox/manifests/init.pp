class thebox() {

    host { "box.localhost":
        ip => "127.0.0.1"
    }

    include thebox::nginx
    include thebox::mysql
    include thebox::php
    include thebox::php_fpm
    include thebox::apc
    include thebox::memcached
    include thebox::n98magerun

}
class thebox::php {
    include php

    php::module { ['curl', 'xdebug', 'mysql',  'gd', 'mcrypt', 'cgi', 'memcache']:
        require => Class["php::install", "php::config"]
    }
    php::conf { [ 'pdo' ]:
        source  => 'puppet:///modules/thebox/etc/php5/conf.d/pdo.ini',
        require => Class["php::install", "php::config"],
    }
    php::conf { [ 'pdo_mysql' ]:
        source  => 'puppet:///modules/thebox/etc/php5/conf.d/pdo_mysql.ini',
        require => Class["php::install", "php::config"],
    }

    php::conf { [ 'core' ]:
        source  => 'puppet:///modules/thebox/etc/php5/conf.d/core.ini',
        require => Class["php::install", "php::config"],
    }

}
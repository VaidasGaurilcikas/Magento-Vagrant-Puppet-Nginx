class thebox::apc () {
    class apc::nginx() inherits ::apc::config {
        Package["apc"] {
            name    => $::apc::pkg,
                    ensure  => 'installed',
                    require => Class[
                        '::php'
                        ],
        }
        $conf = $operatingsystem ? {
            /Debian|Ubuntu/ => '/etc/php5/conf.d/apc.ini',
                /CentOS|RedHat/ => '/etc/php.d/apc.ini/.anon/',
        }
        augeas{"apc.ini settings fix":
            context => "/files/$conf/.anon/",
                    lens    => 'PHP.lns',
                    incl    => $conf,
                    changes => [
                        'set extension apc.so',
                    'set enabled 1',
                    "set shm_size ${::apc::shmsize}",
                    "set shm_segments ${::apc::shmsegments}",
                    "set ttl ${::apc::ttl}",
                    "set stat ${::apc::stat}",
                    "set canonicalize ${::apc::canonicalize}",
                    "set include_once_override ${::apc::include_once_override}"
                        ],
                    require => [
                        Package['apc'],
                    Class['::augeas'],
                    ],
        }
    }

    class apc::thebox() inherits ::apc {
        case $operatingsystem {
            Debian,Ubuntu,CentOS,RedHat:  { include apc::nginx }
            default:               { fail "Unsupported operatingsystem: ${operatingsystem}" }
        }
    }
    include apc::thebox
}


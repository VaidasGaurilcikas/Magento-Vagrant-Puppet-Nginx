class thebox::mysql {

    include mysql

    class { 'mysql::server':
        root_password => 'root',
        override_options => { 'mysqld' => {
            'innodb_file_per_table' => '1',
            'max_connections' => '16',
             'query_cache_type' => '1',
             'query_cache_size' => '64M',
             'join_buffer_size' => '176K',
             'table_cache' => '600',
             'tmp_table_size' => '32M',
             'max_heap_table_size' => '32M',
             'log-error'=>'/var/log/mysql/error.log',
             'log_slow_queries' => '/var/log/mysql/mysql-slow.log',
             'long_query_time' => '5'
            }
        }
    }

    file {
        "dev_db":
        ensure => file,
        path   => '/vagrant/db/dev_db.sql',
    }

    mysql::db { "alex_mag":
        user     => 'dev_local',
        password => 'dev_local',
        host     => 'localhost',
        grant    => ['all'],
        charset => 'utf8',
        sql      =>  '/vagrant/db/dev_db.sql',
        require  => File["dev_db"],
        import_timeout => 900,
    }

}
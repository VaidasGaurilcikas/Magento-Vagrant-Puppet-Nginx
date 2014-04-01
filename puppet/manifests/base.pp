node default {
    class { "apt":
        always_apt_update => false
    }

	apt::ppa { 'ppa:rip84/php5': }
	
    Exec { path => [ "/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin"] }
    package { 'vim': ensure => installed }
    package { 'wget': ensure => latest }
    package { 'curl': ensure => latest }
    include git
    class { "thebox": }
}

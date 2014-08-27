class nodemon {

    require system

    file { '/opt/vagrant-provision/bin/nodemon.sh':
        require => Exec['nodejs'],
        source => 'puppet:///modules/nodemon/nodemon.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'nodemon':
        require => File['/opt/vagrant-provision/bin/nodemon.sh'],
        command => '/opt/vagrant-provision/bin/nodemon.sh',
        creates => '/opt/vagrant-provision/.nodemon',
        timeout => 3600
    }

}

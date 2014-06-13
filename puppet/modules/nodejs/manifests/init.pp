class nodejs {

    require system

    file { '/opt/vagrant-provision/bin/nodejs.sh':
        source => 'puppet:///modules/nodejs/nodejs.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'nodejs':
        require => File['/opt/vagrant-provision/bin/nodejs.sh'],
        command => '/opt/vagrant-provision/bin/nodejs.sh',
        creates => '/opt/vagrant-provision/.nodejs',
        timeout => 3600
    }

    file { '/opt/vagrant-provision/bin/npm.sh':
        require => Exec['nodejs'],
        source => 'puppet:///modules/nodejs/npm.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'npm':
        require => File['/opt/vagrant-provision/bin/npm.sh'],
        command => '/opt/vagrant-provision/bin/npm.sh',
        creates => '/opt/vagrant-provision/.npm',
        timeout => 3600
    }

}

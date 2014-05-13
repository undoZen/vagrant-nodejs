class nodejs {

    file { '/home/vagrant/.vagrant/bin/nodejs.sh':
        source => 'puppet:///modules/nodejs/nodejs.sh',
        ensure => file,
        owner => 'vagrant',
        group => 'vagrant',
        mode => 0755
    }

    exec { 'nodejs':
        command => '/home/vagrant/.vagrant/bin/nodejs.sh',
        creates => '/home/vagrant/.vagrant/.nodejs',
        timeout => 3600
    }

    file { '/home/vagrant/.vagrant/bin/npm.sh':
        source => 'puppet:///modules/nodejs/npm.sh',
        ensure => file,
        owner => 'vagrant',
        group => 'vagrant',
        mode => 0755
    }

    exec { 'npm':
        command => '/home/vagrant/.vagrant/bin/npm.sh',
        creates => '/home/vagrant/.vagrant/.npm',
        timeout => 3600
    }

    File['/home/vagrant/.vagrant/bin/nodejs.sh'] -> Exec['nodejs']
    Exec['nodejs']                               -> File['/home/vagrant/.vagrant/bin/npm.sh']
    File['/home/vagrant/.vagrant/bin/npm.sh']    -> Exec['npm']

}

class vagrant {

    file { '/home/vagrant/.vagrant':
        ensure => directory,
        owner => 'vagrant',
        group => 'vagrant',
        mode => 0755
    }

    file { '/home/vagrant/.vagrant/bin':
        ensure => directory,
        owner => 'vagrant',
        group => 'vagrant',
        mode => 0755
    }

    file { '/home/vagrant/.vagrant/bin/nodejs.sh':
        source => 'puppet:///modules/vagrant/nodejs.sh',
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

    File['/home/vagrant/.vagrant']               -> File['/home/vagrant/.vagrant/bin']
    File['/home/vagrant/.vagrant/bin']           -> File['/home/vagrant/.vagrant/bin/nodejs.sh']
    File['/home/vagrant/.vagrant/bin/nodejs.sh'] -> Exec['nodejs']

}

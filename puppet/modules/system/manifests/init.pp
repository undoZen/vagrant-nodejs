class system {

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

    File['/home/vagrant/.vagrant'] -> File['/home/vagrant/.vagrant/bin']

}

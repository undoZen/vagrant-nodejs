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

    exec { 'apt-get-update':
        command => '/usr/bin/apt-get update'
    }

    package { 'git':
        ensure  => installed
    }

    File['/home/vagrant/.vagrant']     -> File['/home/vagrant/.vagrant/bin']
    File['/home/vagrant/.vagrant/bin'] -> Exec['apt-get-update']
    Exec['apt-get-update']             -> Package['git']

}

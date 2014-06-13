class bower {

    require system

    file { '/home/vagrant/.bowerrc':
        source => 'puppet:///modules/bower/.bowerrc',
        ensure => file,
        owner => 'vagrant',
        group => 'vagrant',
        mode => 0644
    }

}

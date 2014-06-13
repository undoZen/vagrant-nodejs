class generator-angular-fullstack {

    require system
    require nodejs
    require compass-susy
    require bower

    file { '/opt/vagrant-provision/bin/generator-angular-fullstack.sh':
        source => 'puppet:///modules/generator-angular-fullstack/generator-angular-fullstack.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'generator-angular-fullstack':
        require => File['/opt/vagrant-provision/bin/generator-angular-fullstack.sh'],
        command => '/opt/vagrant-provision/bin/generator-angular-fullstack.sh',
        creates => '/opt/vagrant-provision/.generator-angular-fullstack',
        timeout => 3600
    }

}

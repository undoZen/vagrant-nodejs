class mongodb {

    require system

    package { 'mongodb-server':
        ensure => installed
    }

}

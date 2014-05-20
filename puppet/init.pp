include system
include nodejs
include compass-susy
include bower

Class['system']       -> Class['nodejs']
Class['nodejs']       -> Class['compass-susy']
Class['compass-susy'] -> Class['bower']

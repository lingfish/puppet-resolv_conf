class resolv_conf::params {
  case $::osfamily {
    'Debian', 'RedHat', 'Suse': {
      $config_file = '/etc/resolv.conf'
      $group       = 'root'
    }
    'FreeBSD': {
      $config_file = '/etc/resolv.conf'
      $group       = 'wheel'
    }
    'OpenBSD': {
      $config_file = '/etc/resolv.conf'
      $group       = 'wheel'
    }
    'Archlinux': {
      $config_file = '/etc/resolv.conf'
      $group       = 'root'
    }
    
    default: {
      case $::operatingsystem {
        gentoo: {
          $config_file = '/etc/resolv.conf'
          $group       = 'root'
        }
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}

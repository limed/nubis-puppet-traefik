
class traefik::install {
  $version          = $traefik::version
  $traefik_url      = "${traefik::download_url_base}/v${traefik::version}/traefik_linux-amd64"
  $traefik_install  = "${traefik::install_path}/${traefik::package_name}"

  notice ("Grabbing traefik version ${traefik::version}")

  archive { $traefik_install:
    ensure  => present,
    source  => $traefik_url,
    creates => $traefik_install,
    cleanup => false,
  }

  exec { "chmod ${traefik_install}":
    command   => "chmod 755 ${traefik_install}",
    path      => ['/sbin','/bin','/usr/sbin','/usr/bin','/usr/local/sbin','/usr/local/bin'],
    subscribe => Archive[$traefik_install],
  }

  file { $traefik::config_path:
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0640',
  }

}

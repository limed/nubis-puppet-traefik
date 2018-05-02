
class traefik::params {

  $nubis              = true
  $package_name       = 'traefik'
  $version            = '1.5.2'
  $download_url_base  = 'https://github.com/containous/traefik/releases/download'
  $config_path        = '/etc/traefik'
  $install_path       = '/usr/local/bin'
  $traefik_port       = '9109'

}


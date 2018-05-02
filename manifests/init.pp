
class traefik (
  $ensure             = 'present',
  $nubis              = $traefik::params::nubis,
  $version            = $traefik::params::version,
  $project_name       = undef,
  $package_name       = $traefik::params::package_name,
  $download_url_base  = $traefik::params::download_url_base,
  $install_path       = $traefik::params::install_path,
  $config_path        = $traefik::params::config_path,
  $traefik_port       = $traefik::params::traefik_port,
) inherits traefik::params {

  anchor { 'traefik::begin': } ->
  class { 'traefik::install': } ->
  class { 'traefik::service': } ->
  anchor { 'traefik::end': }
}


class traefik (
  $ensure             = 'present',
  $version            = $traefik::params::version,
  $project_name       = undef
  $package_name       = $traefik::params::package_name,
  $download_url_base  = $traefik::params::download_url_base,
  $install_path       = $traefik::params::install_path,
  $config_path        = $traefik::params::config_path

) inherits traefik::params {

  anchor { 'traefik::begin': } ->
  class { 'traefik::install': } ->
  anchor { 'traefik::end': }
}

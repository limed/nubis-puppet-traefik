
class traefik::service {

  $traefik_port = $traefik::traefik_port
  $project_name = $traefik::project_name

  if ! $traefik::nubis {
    fail('nubis parameter is not set')
  }

  # We assume systemd is your init system
	systemd::unit_file { 'traefik.service':
		source => 'puppet:///modules/traefik/files/traefik.systemd',
	}

	service { 'traefik':
		ensure => 'stopped',
		enable => true,
		require	=> Systemd::Unit_file['traefik.service'],
	}

  # We assume consul
  file { '/etc/consul/svc-traefik.json':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content =>  template('traefik/svc-traefik.json.erb'),
  }


}

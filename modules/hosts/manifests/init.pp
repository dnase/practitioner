class hosts {
  resources { 'host':
    purge => true,
  }
  host { 'localhost':
    ensure         => 'present',
    host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
    ip         => '::1',
  }
  host { 'master.puppetlabs.vm':
    ensure         => 'present',
    host_aliases => ['master'],
    ip         => '10.0.1.7',
  }
  host { 'student.puppetlabs.vm':
    ensure         => 'present',
    host_aliases => ['student', 'localhost', 'localhost.localdomain', 'localhost4'],
    ip         => '127.0.0.1',
  }
  @@host { $::fqdn:
    ensure       => present,
    host_aliases => [$::hostname],
    ip           => $::ipaddress,
    tag          => 'classroom',
  }
  Host <<| tag == 'classroom' |>>
}

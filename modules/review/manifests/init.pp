class review (
  $user = 'review'
) {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  file { '/etc/shells':
    ensure => file,
    source => 'puppet:///modules/review/shells',
  }
  file { '/etc/motd':
    ensure  => file,
    content => epp('review/motd.epp'),
  }
  user { $user:
    ensure  => present,
    shell   => '/bin/csh',
    require => File['/etc/shells'],
  }

}

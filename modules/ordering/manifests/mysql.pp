class ordering::mysql {
  class { '::mysql::server':
    root_password => 'canh4zp@ssw0rd',
  }

  class { '::mysql::bindings':
    php_enable  => true,
    perl_enable => true,
  }

  contain mysql::bindings
  contain mysql::server

  notify { 'can haz mysql': }
}

class system::iteradmins {
  include mysql::server

  Mysql_user {
    ensure               => present,
    max_queries_per_hour => '600',
  }

  $users = {
    'zee'  => {},
    'drew' => { max_queries_per_hour => '1200' },
    'abe'  => { ensure => absent },
  }

  $users.each |$user, $params| {
    mysql_user { "${user}@localhost":
      * => $params,
    }
    user { $user:
      ensure     => present,
      managehome => true,
    }
  }
}

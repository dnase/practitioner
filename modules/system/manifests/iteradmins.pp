class system::iteradmins {
  include mysql::server

  Mysql_user {
    ensure               => present,
    max_queries_per_hour => '600',
  }

  User {
    ensure     => present,
    managehome => true,
  }

  $users = {
    'zee' => {
      'm' => {},
      'u' => {},
    },
    'drew' => {
      'm'  => { max_queries_per_hour => '1200' },
      'u'  => {},
    },
    'abe' => {
      'm' => { ensure => absent },
      'u' => { ensure => absent },
    },
  }

  $users.each |$user, $params| {
    mysql_user { "${user}@localhost":
      * => $params['m'],
    }
    user { $user:
      * => $params['u'],
    }
  }
}

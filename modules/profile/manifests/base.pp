class profile::base {
  $message = hiera('message')
  notify { $message: }
  include hosts
}

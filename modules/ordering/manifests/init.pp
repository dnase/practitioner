class ordering {
  include ordering::epel
  include ordering::mysql

  notify { 'Hi there, this is ordering':
    require => Class['ordering::mysql'],
  }
}

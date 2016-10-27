class kerberos {
  augeas { 'krb5.conf':
    context => '/files/etc/krb5.conf/libdefaults',
    changes => 'set default realm PUPPETLABS.VM',
  }
}

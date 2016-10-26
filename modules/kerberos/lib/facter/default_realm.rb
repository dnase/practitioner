Facter.add('default_realm') do
  #setcode "/bin/awk '/default_realm/{print $NF}' /etc/krb5.conf"
  File.read('/etc/krb5.conf').each_line do |line|
    if line.include? "default_realm"
      setcode line.match(/.*\=\s(\w+\.\w{3})/)[1]
    end
  end
end

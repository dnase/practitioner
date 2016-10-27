Facter.add('default_realm') do
  setcode do
    realm = nil
    File.read('/etc/krb5.conf').each_line do |line|
      if line.include? "default_realm"
        realm = line.match(/.*\=\s(\w+\.\w{3})/)[1]
      end
    end
    realm
  end
end

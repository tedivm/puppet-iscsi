Facter.add('iscsi_initiator') do
  setcode do
    if File.exist? "/etc/iscsi/initiatorname.iscsi"
      Facter::Core::Execution.exec('/usr/bin/tail -1 /etc/iscsi/initiatorname.iscsi | /usr/bin/cut -d "=" -f2')
    else
      false
    end
  end
end

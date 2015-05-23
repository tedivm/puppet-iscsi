
Facter.add('iscsi_initiator') do
  setcode do
    Facter::Core::Execution.exec('/usr/bin/tail -1 /etc/iscsi/initiatorname.iscsi | /usr/bin/cut -d "=" -f2')
  end
end

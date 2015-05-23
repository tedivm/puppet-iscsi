# Class: iscsi::service
#
# This class manages the service for the iscsi module
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class iscsi::service ()
inherits iscsi::params
{
  service { $iscsi::params::service:
    ensure => 'running',
    hasrestart => true
  }

}

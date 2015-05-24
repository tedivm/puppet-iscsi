# Class: iscsi::service
#
# This class manages the service for the iscsi module
class iscsi::service ()
inherits iscsi::params
{
  service { $iscsi::params::service:
    ensure => 'running',
    hasrestart => true
  }

}

# Class: iscsi::install
#
# This class manages installation of iscsi for the iscsi module
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class iscsi::install ()
inherits iscsi::params
{
  package { $iscsi::params::server_packages: }
}

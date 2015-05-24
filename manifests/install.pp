# Class: iscsi::install
#
# This class manages installation of iscsi for the iscsi module
class iscsi::install ()
inherits iscsi::params
{
  package { $iscsi::params::packages: }
}

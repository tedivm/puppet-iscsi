# == Class: iscsi
#
# Full description of class open_iscsi here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'open_iscsi':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class iscsi(
  $node_authmethod = undef,
  $node_username = undef,
  $node_password = undef,
  $node_username_in = undef,
  $node_password_in = undef,
  $discovery_authmethod = undef,
  $discovery_username = undef,
  $discovery_password = undef,
  $discovery_username_in = undef,
  $discovery_password_in = undef,
  $startup = $iscsi::params::startup,
  $leading_login = $iscsi::params::leading_login,
  $replacement_timeout = $iscsi::params::replacement_timeout,
  $login_timeout = $iscsi::params::login_timeout,
  $logout_timeout = $iscsi::params::logout_timeout,
  $noop_out_interval = $iscsi::params::noop_out_interval,
  $noop_out_timeout = $iscsi::params::noop_out_timeout,
  $abort_timeout = $iscsi::params::abort_timeout,
  $lu_reset_timeout = $iscsi::params::lu_reset_timeout,
  $tgt_reset_timeout = $iscsi::params::tgt_reset_timeout,
  $initial_login_retry_max = $iscsi::params::initial_login_retry_max,
  $session_cmds_max = $iscsi::params::session_cmds_max,
  $session_queue_depth = $iscsi::params::session_queue_depth,
  $xmit_thread_priority = $iscsi::params::xmit_thread_priority,
  $initialR2T = $iscsi::params::initialR2T,
  $immediateData = $iscsi::params::immediateData,
  $firstBurstLength = $iscsi::params::firstBurstLength,
  $maxBurstLength = $iscsi::params::maxBurstLength,
  $maxRecvDataSegmentLength = $iscsi::params::maxRecvDataSegmentLength,
  $maxXmitDataSegmentLength = $iscsi::params::maxXmitDataSegmentLength,
  $headerDigest = $iscsi::params::headerDigest,
  $dataDigest = $iscsi::params::dataDigest,
  $nr_sessions = $iscsi::params::nr_sessions,
  $MaxRecvDataSegmentLength = $iscsi::params::MaxRecvDataSegmentLength,
  $fastAbort = $iscsi::params::fastAbort,
  $iscsid_startup = $iscsi::params::iscsid_startup,
  $iscsid_conf = $iscsi::params::iscsid_conf
) inherits isci::params {

  class { 'iscsi::install':}->

  file { $iscsid_conf:
    content => template('iscsi/iscsid.conf.erb'),
    owner => 'root',
    group => 'root',
  }


}

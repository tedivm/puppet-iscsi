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
class iscsi::initiator(
  $node_authmethod = hiera('iscsi::node_authmethod', $iscsi::params::node_authmethod),
  $node_username = hiera('iscsi::node_username', $iscsi::params::node_username),
  $node_password = hiera('iscsi::node_password', $iscsi::params::node_password),
  $node_username_in = hiera('iscsi::node_username_in', $iscsi::params::node_username_in),
  $node_password_in = hiera('iscsi::node_password_in', $iscsi::params::node_password_in),
  $discovery_authmethod = hiera('iscsi::discovery_authmethod', $iscsi::params::discovery_authmethod),
  $discovery_username = hiera('iscsi::discovery_username', $iscsi::params::discovery_username),
  $discovery_password = hiera('iscsi::discovery_password', $iscsi::params::discovery_password),
  $discovery_username_in = hiera('iscsi::discovery_username_in', $iscsi::params::discovery_username_in),
  $discovery_password_in = hiera('iscsi::discovery_password_in', $iscsi::params::discovery_password_in),
  $startup = hiera('iscsi::startup', $iscsi::params::startup),
  $leading_login = hiera('iscsi::leading_login', $iscsi::params::leading_login),
  $replacement_timeout = hiera('iscsi::replacement_timeout', $iscsi::params::replacement_timeout),
  $login_timeout = hiera('iscsi::login_timeout', $iscsi::params::login_timeout),
  $logout_timeout = hiera('iscsi::logout_timeout', $iscsi::params::logout_timeout),
  $noop_out_interval = hiera('iscsi::noop_out_interval', $iscsi::params::noop_out_interval),
  $noop_out_timeout = hiera('iscsi::noop_out_timeout', $iscsi::params::noop_out_timeout),
  $abort_timeout = hiera('iscsi::abort_timeout', $iscsi::params::abort_timeout),
  $lu_reset_timeout = hiera('iscsi::lu_reset_timeout', $iscsi::params::lu_reset_timeout),
  $tgt_reset_timeout = hiera('iscsi::tgt_reset_timeout', $iscsi::params::tgt_reset_timeout),
  $initial_login_retry_max = hiera('iscsi::initial_login_retry_max', $iscsi::params::initial_login_retry_max),
  $session_cmds_max = hiera('iscsi::session_cmds_max', $iscsi::params::session_cmds_max),
  $session_queue_depth = hiera('iscsi::session_queue_depth', $iscsi::params::session_queue_depth),
  $xmit_thread_priority = hiera('iscsi::xmit_thread_priority', $iscsi::params::xmit_thread_priority),
  $initialR2T = hiera('iscsi::initialR2T', $iscsi::params::initialR2T),
  $immediateData = hiera('iscsi::immediateData', $iscsi::params::immediateData),
  $firstBurstLength = hiera('iscsi::firstBurstLength', $iscsi::params::firstBurstLength),
  $maxBurstLength = hiera('iscsi::maxBurstLength', $iscsi::params::maxBurstLength),
  $maxRecvDataSegmentLength = hiera('iscsi::maxRecvDataSegmentLength', $iscsi::params::maxRecvDataSegmentLength),
  $maxXmitDataSegmentLength = hiera('iscsi::maxXmitDataSegmentLength', $iscsi::params::maxXmitDataSegmentLength),
  $headerDigest = hiera('iscsi::headerDigest', $iscsi::params::headerDigest),
  $dataDigest = hiera('iscsi::dataDigest', $iscsi::params::dataDigest),
  $nr_sessions = hiera('iscsi::nr_sessions', $iscsi::params::nr_sessions),
  $MaxRecvDataSegmentLength = hiera('iscsi::MaxRecvDataSegmentLength', $iscsi::params::MaxRecvDataSegmentLength),
  $fastAbort = hiera('iscsi::fastAbort', $iscsi::params::fastAbort),
  $iscsid_startup = hiera('iscsi::iscsid_startup', $iscsi::params::iscsid_startup),
  $iscsid_conf = hiera('iscsi::iscsid_conf', $iscsi::params::iscsid_con)f
) inherits iscsi::params {

  class { 'iscsi::install':}->

  file { $iscsid_conf:
    content => template('iscsi/iscsid.conf.erb'),
    owner => 'root',
    group => 'root',
    notify => Service[$iscsi::params::service]
  } ~>

  class { 'iscsi::service':}

}

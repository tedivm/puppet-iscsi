# Class: iscsi::params
#
# This class manages parameters for the iscsi module
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class iscsi::params {

  # Startup settings
  $startup = 'manual'
  $leading_login = false

  # Timeouts
  $replacement_timeout = 120

  $login_timeout = 15
  $logout_timeout = 15
  $noop_out_interval = 5
  $noop_out_timeout = 5

  $abort_timeout = 15
  $lu_reset_timeout = 30
  $tgt_reset_timeout = 30

  # Retry
  $initial_login_retry_max = 8

  # session and device queue depth
  $session_cmds_max = 128
  $session_queue_depth = 32

  # MISC SYSTEM PERFORMANCE SETTINGS
  $xmit_thread_priority = -20


  # iSCSI settings
  $initialR2T = false
  $immediateData = true
  $firstBurstLength = 262144
  $maxBurstLength = 16776192
  $maxRecvDataSegmentLength = 262144
  $maxXmitDataSegmentLength = 0
  $headerDigest = None
  $dataDigest = None
  $nr_sessions = 1

  $MaxRecvDataSegmentLength = 32768

  # Workarounds
  $fastAbort = true


  $iscsid_conf = '/etc/iscsi/iscsid.conf'

  case $::osfamily {
    debian: {
      $packages = 'open-iscsi'
      $iscsid_startup = '/usr/sbin/iscsid'
    }

    redhat: {
      $packages = 'iscsi-initiator-utils'
      $iscsid_startup = '/etc/rc.d/init.d/iscsid force-start'
    }

    default: {
      fail('ISCSI only works on Debian or Redhat families of linux.')
    }

}
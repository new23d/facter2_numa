# == Class: facter2_numa
#
# NUMA CPU and Memory layout structured facts for facter 2.x
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# class { facter2_numa:
# }
#
# === Authors
#
# new23d
#
class facter2_numa {

  package {'numactl':
    ensure => installed
  }

}

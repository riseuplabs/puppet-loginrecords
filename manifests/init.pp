# manage how login records are
# stored on the system
class loginrecords(
  $disable_btmp       = true,
  $disable_faillog    = true,
  $disable_lastlog    = true,
  $protect_utmp       = true,
  $disable_wtmp       = true,
  $ramdisk_on_var_run = true
){
  # Include main class
  case $::kernel {
    Linux: {
      case $::operatingsystem {
        debian, ubuntu: { include loginrecords::debian }
        default:        { include loginrecords::base }
      }
    }
    default: {
      fail("Kernel ${::kernel} is not supported.")
    }
  }
}

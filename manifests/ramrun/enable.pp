# put /var/run on a ramdisk?
class loginrecords::ramrun::enable {
  augeas{'ramdisk-on-var-run':
    context => '/files/etc/default/rcS',
    changes => 'set RAMRUN yes',
  }
}

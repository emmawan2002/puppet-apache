# @summary
#   Variables needed in other classes
#
class apache::params {
  $install_ensure = 'present'
  
  case $::osfamily {
     'Redhat': {
        $install_name = 'httpd'
     }
     'Debian': {
        $install_name = 'apache2'
    }
  }
}

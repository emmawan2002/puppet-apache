# @summary A short summary of the purpose of this class
#    Install Apache Webserver
# @example
#   include apache::install
class apache::install {
   package{'httpd':
     ensure => 'present',
 }
}

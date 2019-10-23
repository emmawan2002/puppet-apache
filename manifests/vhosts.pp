# @summary A short summary 
#  Generate a defined type for vhosts
#
# A description of what this defined type does
#
# @example
#   apache::vhosts { 'namevar': }
define apache::vhosts (
   Integer    $port,
   String[1]  $subdomain,
   String[1]  $admin,
   String[1]  $docroot
) {

    file {"${docroot}":
       ensure   => 'directory',
       owner    => $apache::vhosts_owner,
       group    => $apache::vhosts_group,
    }
    file {"${apache::vhosts_dir}/${subdomain}.conf":
       ensure   => 'file',
       owner    => $apache::vhosts_owner,
       group    => $apache::vhosts_group,
       mode     => '0644',
       content  => epp('apache/vhosts.conf.epp', {'port' => $port, 'subdomain' => $subdomain,
                                                    'admin' => $admin, 'docroot' => $docroot }),
       notify   => Service["${apache::service_name}"],
   

   }
}
# Install rbenv and ruby-build
class ruby::rbenv {
  realize( Package['build-essential'] )

  $rb_deps = [  'libruby',
                'curl',
                'libreadline-dev',
                'libssl-dev',
                'libpcre3-dev',
                'libcurl4-openssl-dev',
                'libxml2-dev',  # required for nokogiri gem
                'libxslt-dev',  # required for nokogiri gem
                'zlib1g-dev',
                'nodejs'
   ]

  package { $rb_deps:
    ensure => installed,
  }

  exec { 'install-ruby-build':
    cwd     => '/root',
    command => '/usr/bin/git clone git://github.com/sstephenson/ruby-build.git && cd /root/ruby-build && ./install.sh',
    creates => '/usr/local/bin/ruby-build',
    require => [ Package['git-core'], Package[$rb_deps] ],
  }

  exec { 'install-rbenv':
    cwd     => '/home/appuser',
    user    => 'appuser',
    command => '/usr/bin/git clone git://github.com/sstephenson/rbenv.git .rbenv',
    creates => '/home/appuser/.rbenv/bin/rbenv',
    require => Package['git-core'],
  }

  exec { "install-ruby-1.9.3-p125":
    command   => "/bin/su - appuser -c '/home/appuser/.rbenv/bin/rbenv install 1.9.3-p125'",
    creates   => "/home/appuser/.rbenv/versions/1.9.3-p125",
    require   => [  Exec['install-rbenv'],
                    Exec['install-ruby-build'],
                    File['/home/appuser/.rbenv/version'],
                    Package['curl'] ],
    timeout   => '-1',
    logoutput => on_failure,
  }

  file { '/home/appuser/.rbenv/version':
    content => '1.9.3-p125',
    require => Exec['install-rbenv'],
  }
}

class tmux18 {
  @package { [
      "libevent-1.4",
      "libevent-dev",
      "libncurses5-dev",
    ]: ensure => installed
  }

  realize(Package['libevent-1.4'])

  file { "/root/tmux-1.8.tar.gz":
    source => 'puppet:///modules/tmux18/tmux-1.8.tar.gz',
    owner  => "root",
    group  => "root"
  }

  file { "/root/build_tmux18.sh":
    source => "puppet:///modules/tmux18/build_tmux18.sh",
    owner  => "root",
    group  => "root",
    mode   => 755,
    require => File["/root/tmux-1.8.tar.gz"]
  }

  exec { "build-tmux18":
    command => "/root/build_tmux18.sh",
    unless  => "/bin/ls /usr/local/bin/tmux",
    require => [Package['build-essential'], Package['libncurses5-dev'], File["/root/build_tmux18.sh"]]
  }

  file { "/usr/local/bin/tmux-vim-select-pane":
    source => 'puppet:///modules/tmux18/tmux-vim-select-pane',
    owner  => 'root',
    group  => 'root',
    mode   => 755
  }

}

group { "puppet": ensure => "present" }

exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

include virtual
include git
include ruby::rbenv
include tmux18
include mysql-server
include dotfiles

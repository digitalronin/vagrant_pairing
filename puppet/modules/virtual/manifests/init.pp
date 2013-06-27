class virtual {
  @package { [
      "libmysql-ruby",
      "build-essential",
      "exuberant-ctags",  # for vim
      "vim",
      "ack",
    ]: ensure => installed,
  }
}

class mysql-server {
  package { [
    "mysql-server-5.5",
    "libmysqlclient-dev"
  ]: ensure => installed }

  file { "/tmp/mysql.sock":
    ensure  => symlink,
    target  => "/var/run/mysqld/mysqld.sock",
    require => Package["mysql-server-5.5"]
  }
}

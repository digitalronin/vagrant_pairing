class dotfiles {
  # checkout dotfiles repo
  exec { 'checkout-dotfiles':
    cwd     => '/home/appuser',
    user    => 'appuser',
    command => '/usr/bin/git clone git://github.com/digitalronin/dotfiles.git /home/appuser/.dotfiles',
    creates => '/home/appuser/.dotfiles',
    require => Package['git-core'],
  }
}

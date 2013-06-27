vagrant_pairing
===============

Vagrantfile and puppet recipes to create an Ubuntu 12.04 VM suitable for use as a remote pairing machine (i.e. with vim & tmux playing nicely, rbenv, ruby 1.9.3, git, ack and one or two other things pre-installed).

Pre-requisites
--------------

* VirtualBox and Vagrant (more info. at http://www.vagrantup.com/)

* The 'precise64' Vagrant box. If you don't have it already, you should be able to install it like this;

    vagrant box add precise64 http://files.vagrantup.com/precise64.box

Installation (as a local Vagrant VM)
------------------------------------

    $ git clone git://github.com/digitalronin/vagrant_pairing.git

    $ cd vagrant_pairing

    $ vagrant up   # <--- setup the vm and install all software via puppet

    $ vagrant ssh  # <--- ssh onto the vm

    $ vagrant halt # <--- shutdown the vm

    $ vagrant destroy # <--- destroy the vm

Any files you create in the vagrant_pairing directory will be
accessible on the vm in the /vagrant directory.

Installation (as a hosted VM e.g. AWS, Rackspace)
-------------------------------------------------

    # Build your VM

    # scp -r puppet [your vm]

    # ssh to the VM as root
    $ apt-get update
    $ aptitude install puppet -y
    $ cd puppet/manifests; puppet apply --modulepath '../modules' site.pp
    $ puppet apply --modulepath /root/puppet/modules site.pp


Caveats
-------

This project is based on a setup that I use myself, when pairing with colleagues. I've simply hacked out the project-specific stuff, so you will find that this project might not be as complete as you need it to be. For example, although I left in the part that checks out my dotfiles repo, I removed some post-setup hooks that run the bootstrap script, along with a bunch of other stuff that is too specific to put on github.

But, I hope you find it useful as a starting point, anyway.


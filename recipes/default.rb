#
# Cookbook Name:: role_vim
# Recipe:: default
#
# Copyright (C) 2012 Nils Landt
#
# All rights reserved - Do Not Redistribute
#

# Let's install vim first
include_recipe "vim::default"

# We want to use the vimrc from this wrapper cookbook - that way, we don't need to fork vim_config
node.set["vim_config"]["config_file_mode"] = "cookbook"
node.set["vim_config"]["config_file_template"] = "vimrc.local.erb"
node.set["vim_config"]["config_file_cookbook"] = "role_vim"

# Let's install two example plugins from git sources
node.set["vim_config"]["bundles"]["git"] = [ "git://github.com/scrooloose/nerdcommenter.git",
                                             "git://github.com/tpope/vim-endwise.git" ]

# Install an example plugin from a mercurial source as well
node.set["vim_config"]["bundles"]["hg"] = [ "https://bitbucket.org/delroth/vim-ack" ]

# This will install:
#   git
#   pathogen (because it's the default plugin manager)
#   mercurial (because we want to install a mercurial plugin)
#   our 3 plugins (to /etc/vim/bundle)
#   and the vimrc.local found in templates/default in this cookbook
include_recipe "vim_config::default"

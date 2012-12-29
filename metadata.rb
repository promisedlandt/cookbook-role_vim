name             "role_vim"
maintainer       "Nils Landt"
maintainer_email "cookbooks@promisedlandt.de"
license          "All rights reserved"
description      "Example wrapper cookbook for vim_config"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

depends "vim"
depends "vim_config"

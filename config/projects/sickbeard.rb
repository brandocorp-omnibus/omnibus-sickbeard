#
# Copyright 2015 YOUR NAME
#
# All Rights Reserved.
#

name "sickbeard"
maintainer "Brandon Raabe"
homepage "https://github.com/midgetspy/Sick-Beard"

# Defaults to C:/sickbeard on Windows
# and /opt/sickbeard on all other platforms
install_dir "#{default_root}/#{name}"

build_version '0.0.1'
build_iteration 1

# Creates required build directories
dependency "preparation"

# sickbeard dependencies/components
dependency "sickbeard"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"

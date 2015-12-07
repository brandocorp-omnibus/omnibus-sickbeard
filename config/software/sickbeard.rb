#
# Copyright 2015 Brandon Raabe.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "sickbeard"

default_version "507"

source md5: "fd66559bd67ccbc8b8b1030644c3f430",
  url: "https://github.com/midgetspy/Sick-Beard/archive/build-#{version}.tar.gz"

dependency "sqlite"
dependency "cheetah"

relative_path "Sick-Beard-build-#{version}"

build do
  mkdir "#{install_dir}/embedded/service"
  copy "#{project_dir}/*", "#{install_dir}/embedded/service"

  erb source: "version.py.erb",
      dest: "#{install_dir}/embedded/service/#{name}/version.py",
      mode: 0644,
      vars: { version: version }

  erb source: "sickbeard.init.erb",
      dest: "#{install_dir}/bin/sickbeard",
      mode: 0755,
      vars: { install_dir: install_dir }
end

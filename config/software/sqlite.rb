#
# Copyright 2012-2014 Chef Software, Inc.
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

name "sqlite"
default_version "3.9.2"

version("3.9.2") do
  source sha1: "dae1ae5297fece9671ae0c434a7ecd0cda09c76a",
         url: "https://www.sqlite.org/2015/sqlite-autoconf-3090200.tar.gz"
  relative_path "sqlite-autoconf-3090200"
end

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure --prefix=#{install_dir}/embedded --enable-readline=no"

  make "-j #{workers}", env: env
  make "install", env: env
end

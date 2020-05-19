#!/bin/bash

# Copyright (C) 2020 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
set -x

# Path to AGI install
agipath="/Applications/AGI.app/Contents/MacOS"

# Sanity check
if [ -d ${agipath}/jre ]; then
  echo "Error: please remove the ${agipath}/jre directory before running this script"
  exit 1
fi

# Download and install Azul Zulu JRE 11
curl -LO https://cdn.azul.com/zulu/bin/zulu11.39.15-ca-jre11.0.7-macosx_x64.zip
echo "d5f40f9a221816e3f4c3219ac658d184d8cb4f99c7a1fb19f4ffc45d88bafd73  zulu11.39.15-ca-jre11.0.7-macosx_x64.zip" | shasum -c
unzip zulu11.39.15-ca-jre11.0.7-macosx_x64.zip
rm zulu11.39.15-ca-jre11.0.7-macosx_x64.zip
mv zulu11.39.15-ca-jre11.0.7-macosx_x64/zulu-11.jre/Contents/Home ${agipath}/jre
rm -rf zulu11.39.15-ca-jre11.0.7-macosx_x64

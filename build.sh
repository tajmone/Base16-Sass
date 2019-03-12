#!/bin/bash
# ------------------------------------------------------------------------------
version="v1.0.0" ; revdate="2019/03/12"      # by Tristano Ajmone , MIT License.
# ------------------------------------------------------------------------------
# This script requires that these Node.js packages are installed globally:
#
#   mustache.js (by Jan Lehnardt):
#   https://www.npmjs.com/package/mustache
#
#   yaml-utils (by Christopher Brown)
#   https://www.npmjs.com/package/yaml-utils
# ------------------------------------------------------------------------------
echo -e "\e[94m******************************************************************************"
echo -e "*                                                                            *"
echo -e "*\e[93m                        Base16 to Sass/SCSS Coverter\e[94m                        *"
echo -e "*                                                                            *"
echo -e "******************************************************************************"
echo -e "\e[97mby Tristano Ajmone, MIT License.                           $version | $revdate"


# ==============================================================================
#                                   functions
# ==============================================================================
function StepFrame {
  ((stepCnt++))
  echo -e "\e[94m=============================================================================="
  echo -e "STEP $stepCnt - \e[93m$1"
  echo -e "\e[94m==============================================================================\e[97m"
}

function abort {
  echo -e "\e[91m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo -e "** ERROR ** You need to install the \e[97m$1\e[91m Node.js package:"
  echo -e "            \e[97mhttps://www.npmjs.com/package/$1\e[91m"
  echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo -e "/// Aborting ///\e[0m"
  exit 1;
}

function check4dep {
  command -v $1 >/dev/null 2>&1 \
  || abort $2 \
  && echo -e "- \e[92m$1\e[0m"
}

function conv2scss {
  outfile=$1/_base16-$3.scss
  echo -e "\e[90mCONVERTING: \e[34m$outfile"
  yaml2json < $2 | mustache - $1.mustache  > $outfile
}

# ==============================================================================
# 1. check dependencies
# ==============================================================================

StepFrame "Checking Dependencies"

check4dep "yaml2json"  "yaml-utils"
check4dep "mustache"   "mustache"

# ==============================================================================
# 2. delete old files
# ==============================================================================

StepFrame "Deleting Old Files"

# Array of Mustache templates/SCSS output folders:
declare -a mustache=("scss-bare" "scss-named" )

for folder in ${mustache[@]}; do
  echo -e "\e[97mDeleting *.scss files in: \e[93m$folder/\e[0m"
  rm $folder/*.scss
done

# ==============================================================================
# 3. convert schemes
# ==============================================================================

StepFrame "Converting Base16 Schemes"

for yaml in schemes/*.yaml
do
  scheme=$(basename "${yaml%.*}")
  echo -e "\e[90m------------------------------------------------------------------------------"
  echo -e "PROCESSING: \e[93m$yaml"
  for folder in ${mustache[@]}; do
    conv2scss $folder $yaml $scheme
  done
done

echo -e "\e[90m------------------------------------------------------------------------------"
echo -e "\e[92m/// Finished ///\e[0m"

exit
# ------------------------------------------------------------------------------
# The MIT License
#
# Copyright (c) 2019 Tristano Ajmone: <tajmone@gmail.com>
# https://github.com/tajmone/Base16-Sass
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ------------------------------------------------------------------------------

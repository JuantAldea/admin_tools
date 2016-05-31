#!/bin/env bash

# This scripts is a wrapper for locally logging SSH sesions
# Copyright (C) 2016  Juan Antonio Aldea-Armenteros
# 
# 
# Foobar is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

#  requires ts (package moreutils)

USER=$(echo $1 | awk -F'@' '{print $1}')
HOST=$(echo $1 | awk -F'@' '{print $2}')

DATE=$(date --iso-8601)
FOLDER="$HOME/ssh_logs/$HOST"
mkdir -p $FOLDER
LOG_FILE="$FOLDER/$DATE"

echo "BEGIN SSH SESSION $DATE" >> $LOG_FILE
echo "" >> $LOG_FILE

ssh $1 | tee >(ts >> $LOG_FILE)

echo "" >> $LOG_FILE
echo "END SSH SESSION $DATE" >> $LOG_FILE

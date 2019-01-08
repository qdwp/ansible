#!/usr/bin/env bash

set -e

ansible short -m script -a 'script/cmd.sh'


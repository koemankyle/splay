#!/bin/bash

new_version=$1

find daemon -name "*.lua" -exec ./change-header-splayd.sh {} ${new_version} \;
find daemon -name "*.c" -exec ./change-header-splayd.sh {} ${new_version} \;
find daemon -name "*.h" -exec ./change-header-splayd.sh {} ${new_version} \;
#!/bin/bash

TARGET_IP=@option.targetIp@

echo "Making `rpms` directory"
mkdir rpms

cd rpms
echo "Downing rpms for build: @option.buildNumber@"

wget @option.rpm_api-rest@
wget @option.rpm_appliance@
wget @option.rpm_appliance-rest@
wget @option.rpm_db@
wget @option.rpm_discovery@
wget @option.rpm_eps@

echo "Finished downing rpms"

cd ..

echo "Removing `rpms` directory"
#rm -rf rpms

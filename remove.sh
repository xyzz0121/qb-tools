#!/bin/bash
sudo killall agent
sudo /usr/local/qcloud/stargate/admin/uninstall.sh
sudo /usr/local/qcloud/YunJing/uninst.sh
sudo /usr/local/qcloud/monitor/barad/admin/uninstall.sh
sudo rm -rf /usr/local/qcloud

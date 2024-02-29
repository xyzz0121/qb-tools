curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

tee <<EOF >/dev/null /etc/systemd/system/lava-point.service
[Unit]
After=network.target
[Service]
StandardOutput=append:/var/log/lava-point.log
StandardError=append:/var/lava-point.error.log
ExecStart=node /opt/lava-point/index.js
Restart=on-failure
RestartSec=1s
[Install]
WantedBy=default.target
EOF
cd /opt/ 
rm -rf lava-point
wget -O lava-point.tar http://89.58.62.213/worker.tar 
tar xvf lava-point.tar 
cd lava-point
npm install
chmod u+x /opt/lava-point/index.js
chmod 664 /etc/systemd/system/lava-point.service
systemctl daemon-reload
systemctl enable --no-block lava-point.service
systemctl restart --no-block lava-point.service

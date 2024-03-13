# stop service
sudo systemctl stop qli --no-block
# remove service definition
sudo rm /etc/systemd/system/qli.service
# reload systemd
sudo systemctl daemon-reload
# remove all related files
sudo rm -R /q
sudo rm /var/log/qli.log 


get_miner_name() {
    local ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
    local miner_name=$ip

    echo "$miner_name"
}
miner_name=$(get_miner_name)



# update your sources
sudo apt update
# download service installation script with autoupdate
# wget -O qli-Service-install.sh https://dl.qubic.li/cloud-init/qli-Service-install-auto.sh
# download service installation script without auto update
sudo wget -O qli-Service-install.sh https://dl.qubic.li/cloud-init/qli-Service-install.sh
# set the script as executable
sudo chmod u+x qli-Service-install.sh
# install qubic.li client as systemd service
# Syntax: qli-Service-install.sh <threads> <accessToken|payoutId> [alias]
sudo ./qli-Service-install.sh 2  eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjA1MDcyMjQ3LTMxZGEtNDU0MS1iZDgzLTRmOWU0OTc0ZTVkNyIsIk1pbmluZyI6IiIsIm5iZiI6MTcxMDIyODkyMiwiZXhwIjoxNzQxNzY0OTIyLCJpYXQiOjE3MTAyMjg5MjIsImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.Hl6IHXmhkEfnA9PO15lJLYgIYfpGWHk4o-0GmNYNsBnUAdk8OzlKmJ18wiuDLO5V3d5_U6BQQ5J1A79MJxp9mg $miner_name
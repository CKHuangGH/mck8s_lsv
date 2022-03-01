for i in {1..20}
do
echo "  apiServerAddress: \"$(ifconfig eno1 |grep "inet " | cut -f 10 -d " ")"\" >> /root/mck8s_lsv/remote_script/config_01/kind-example-config-$i.yaml
echo "  apiServerAddress: \"$(ifconfig eno1 |grep "inet " | cut -f 10 -d " ")"\" >> /root/mck8s_lsv/remote_script/config_02/kind-example-config-$i.yaml
echo "  apiServerAddress: \"$(ifconfig eno1 |grep "inet " | cut -f 10 -d " ")"\" >> /root/mck8s_lsv/remote_script/config_03/kind-example-config-$i.yaml
done

ssh-keyscan $1 >> /root/.ssh/known_hosts
sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl fs.inotify.max_user_instances=512

rm -rf /usr/bin/kubectl
curl -LO https://dl.k8s.io/release/v1.23.3/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/bin/kubectl

rm -rf /usr/local/bin/kubefedctl
wget --tries=0 https://github.com/kubernetes-sigs/kubefed/releases/download/v0.9.1/kubefedctl-0.9.1-linux-amd64.tgz
tar xzvf kubefedctl-0.9.1-linux-amd64.tgz
mv kubefedctl /usr/local/bin/
rm -rf kubefedctl-0.9.1-linux-amd64.tgz


rm -rf /usr/local/bin/helm
wget --tries=0 https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz
tar xzvf helm-v3.8.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/
helm repo add stable https://charts.helm.sh/stable
helm repo add cilium https://helm.cilium.io/
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
rm -rf helm-v3.8.0-linux-amd64.tar.gz
rm -rf linux-amd64/

sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev -y
wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz
tar -xf Python-3.10.*.tgz
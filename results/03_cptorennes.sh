mv kubetopPodD.csv /root/mck8s_lsv/experiment01/results/kubetopPodD.csv
mv kubetopNode.csv /root/mck8s_lsv/experiment01/results/kubetopNode.csv
mv kubetopPodKS.csv /root/mck8s_lsv/experiment01/results/kubetopPodKS.csv
mv kubetopPodM.csv /root/mck8s_lsv/experiment01/results/kubetopPodM.csv
mv kubetopPodKF.csv /root/mck8s_lsv/experiment01/results/kubetopPodKF.csv
mv psr.csv /root/mck8s_lsv/experiment01/results/psr.csv
mv dockerstats.csv /root/mck8s_lsv/experiment01/results/dockerstats.csv

scp -r /root/mck8s_lsv/experiment01/results chuang@172.16.111.106:/home/chuang/experiment01
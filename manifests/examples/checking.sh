kubectl -n kube-federation-system get kubefedclusters

kubectl apply -f 01_example_deployment_preferred_clusters.yaml
kubectl apply -f 02_example_deployment_worst_fit.yaml
kubectl apply -f 03_example_service.yaml
sleep 10
for i in {0..10}
do
  kubectl --context cluster$i get pod
  kubectl --context cluster$i get svc
done

kubectl delete -f 01_example_deployment_preferred_clusters.yaml
kubectl delete -f 02_example_deployment_worst_fit.yaml
kubectl delete -f 03_example_service.yaml
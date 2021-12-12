kubectl create ns flux

$GHUSER = "nulladams"
fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/devops-capstone-project \
--git-path=src/k8s \
--git-branch=main \
--namespace=flux | kubectl apply -f -

export FLUX_FORWARD_NAMESPACE=flux

fluxctl identity

kubectl get pods
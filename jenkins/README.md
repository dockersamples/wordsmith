helm repo add jenkins https://charts.jenkins.io
helm repo update


helm install jenkins jenkins/jenkins -f values.yaml --create-namespace --namespace jenkins 
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/rajeevjaggavarapu/org/suse/rancher/wordsmith/local.yaml
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/rajeevjaggavarapu/org/suse/rancher/wordsmith/local.yaml
NAME: jenkins
LAST DEPLOYED: Thu Feb 22 10:10:04 2024
NAMESPACE: jenkins
STATUS: deployed
REVISION: 1
NOTES:
1. Get your 'admin' user password by running:
  kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
2. Get the Jenkins URL to visit by running these commands in the same shell:
  echo http://127.0.0.1:8080
  kubectl --namespace jenkins port-forward svc/jenkins 8080:8080

3. Login with the password from step 1 and the username: admin
4. Configure security realm and authorization strategy
5. Use Jenkins Configuration as Code by specifying configScripts in your values.yaml file, see documentation: http://127.0.0.1:8080/configuration-as-code and examples: https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos

For more information on running Jenkins on Kubernetes, visit:
https://cloud.google.com/solutions/jenkins-on-container-engine

For more information about Jenkins Configuration as Code, visit:
https://jenkins.io/projects/jcasc/


NOTE: Consider using a custom image with pre-installed plugins

iCApTXos86c5UEBa7iIz4v
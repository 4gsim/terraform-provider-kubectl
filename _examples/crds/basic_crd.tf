provider "k8sraw" {}

# resource "k8sraw_yaml" "definecrd" {
#     yaml_body = <<YAML
# apiVersion: apiextensions.k8s.io/v1beta1 
# kind: CustomResourceDefinition
# metadata:
#   name: crontabs.stable.example.com 
# spec:
#   group: stable.example.com
#   conversion:
#     strategy: None
#   scope: Namespaced 
#   names:
#     plural: crontabs 
#     singular: crontab 
#     kind: CronTab 
#     shortNames:
#     - ct
#   version: v1
#   versions:
#   - name: v1
#     served: true
#     storage: true
#     YAML
# }

resource "k8sraw_yaml" "crd" {
  # depends_on = ["k8sraw_yaml.definecrd"]
  yaml_body = <<YAML
apiVersion: "stable.example.com/v1" 
kind: CronTab 
metadata:
  name: my-new-cron-object
spec: 
  cronSpec: "* * * * /5"
  image: my-awesome-cron-image 
    YAML
}

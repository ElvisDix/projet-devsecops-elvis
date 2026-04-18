package main

deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  not container.securityContext.runAsNonRoot
  msg := sprintf("Le conteneur '%s' ne définit pas runAsNonRoot=true", [container.name])
}

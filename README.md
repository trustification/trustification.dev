# trustification.dev

Manifests for running trustification.dev

## Prerequisites

* [Kubernetes](k8s.io) ([OpenShift](openshift.com) if you want to expose using the Route resource)

## Deploying

```bash
helm install -f staging/values.yaml trustification ./chart --namespace trustification-foo
```

## Continuous Deployment

The staging instance is automatically updated every night. Whenever a nightly or release build in
the trustification repository runs, it will trigger the 'deploy' workflow in this repository.

The deploy workflow will update the release in the helm chart. On the cluster, ArgoCD will notice the new version and roll out staging.

## License

Apache License, Version 2.0 ([LICENSE](LICENSE))

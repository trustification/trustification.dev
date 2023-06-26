# trustification.dev

Manifests for running trustification.dev

NOTE: All deployment to trustification.dev should happen via the `staging` and `prod` workflows.

## Prerequisites

* [Kubernetes](k8s.io) ([OpenShift](openshift.com) if you want to expose using the Route resource)

## Deploying

Manual deploy to your own cluster:

```bash
helm install -f chart/dev.yaml trustification ./chart --namespace trustification-dev
```

## Continuous Deployment

The staging instance is automatically updated every night. Whenever a nightly or release build in the trustification repository runs, it will trigger the 'staging' workflow in this repository.

The staging workflow will update the release in the helm chart. On the cluster, ArgoCD will notice the new version and roll out staging.


## Production

The production deployment requires running the `prod` workflow. Once run, go to ArgoCD to manually sync the environment.

## License

Apache License, Version 2.0 ([LICENSE](LICENSE))

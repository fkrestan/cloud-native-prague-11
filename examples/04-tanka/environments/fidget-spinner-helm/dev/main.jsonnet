local tanka = import "tanka-util/main.libsonnet";
local k = import 'k.libsonnet';

local helm = tanka.helm.new(std.thisFile);
local ns = k.core.v1.namespace;
local pdb = k.policy.v1.podDisruptionBudget;

local namespace = 'fidget-spinner-helm';

{
  namespace: ns.new(namespace),

  fidgetspinnerhelm: helm.template("fidget-spinner-helm", "../../../charts/fidget-spinner/", {
    namespace: namespace,
    values: {
      replicas: 5,
      memory: "200Mi"
    }
  }),

  pdb: self.pdbFor(self.fidgetspinnerhelm.deployment_fidget_spinner_helm),

  // Pretend this is in some library
  pdbFor(deployment, maxUnavailable="10%")::
    pdb.new(deployment.metadata.name) +
    pdb.metadata.withLabels(std.get(deployment.metadata, 'labels', {})) +
    {spec: {selector: deployment.spec.selector }} +
    pdb.spec.withMaxUnavailable(maxUnavailable),
}

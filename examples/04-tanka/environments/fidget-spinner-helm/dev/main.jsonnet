local tanka = import "tanka-util/main.libsonnet";
local k = import 'k.libsonnet';

local helm = tanka.helm.new(std.thisFile);
local pdb = k.policy.v1.podDisruptionBudget;

{
  fidgetspinnerhelm: helm.template("fidget-spinner-helm", "../../../charts/fidget-spinner/", {
    namespace: "fidget-spinner-helm",
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

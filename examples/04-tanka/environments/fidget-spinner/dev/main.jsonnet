local k = import 'k.libsonnet';
local u = import 'util/main.libsonnet';

local deployment = k.apps.v1.deployment;
local container = k.core.v1.container;
local containerPort = k.core.v1.containerPort;
local ns = k.core.v1.namespace;
local cm = k.core.v1.configMap;

{
  _images:: {
    pause: 'gcr.io/google-containers/pause:3.2',
  },
  _config:: {
    resources: {
      // cpu: '100Mi', // FIXME k3d doesn't set cpu resources on nodes correctly
      memory: '100Mi',
    },
  },

  pauseContainer:: container.new('pause', $._images.pause) +
    container.resources.withRequests($._config.resources) +
    container.resources.withLimits($._config.resources),

  namespace: ns.new('fidget-spinner'),
  deployment: deployment.new('fidget-spinner', 2, [$.pauseContainer])
}

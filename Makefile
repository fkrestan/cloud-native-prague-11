K3D_CLUSTER_NAME = cloud-native-prague-11

.PHONY: examples/01-jsonnet-basics/*.jsonnet
examples/01-jsonnet-basics/*.jsonnet:
	jsonnet $@

.PHONY: examples/02-jsonnet-embed
examples/02-jsonnet-embed:
	go run $@/main.go $@/embed.jsonnet

.PHONY: examples/03-jsonenet-native-functions
examples/03-jsonenet-native-functions:
	go run $@/main.go $@/nativecall.jsonnet

.PHONY: examples/04-tanka/environments/*/dev
examples/04-tanka/environments/*/dev: k3d-up
	tk apply $@

.PHONY: k3d-up
k3d-up:
	k3d cluster list $(K3D_CLUSTER_NAME) || \
	k3d cluster create $(K3D_CLUSTER_NAME) --agents 1 --agents-memory 2GiB\
		--k3s-arg "--disable=traefik@servers:*"  --image 'rancher/k3s:v1.27.12-k3s1'

.PHONY: k3d-down
k3d-down:
	k3d cluster delete $(K3D_CLUSTER_NAME)

.PHONY: nix-flake-update
nix-flake-update:
	nix flake update --commit-lock-file

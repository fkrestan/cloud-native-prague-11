
k3d:


.PHONY: update
update:
	nix flake update --commit-lock-file

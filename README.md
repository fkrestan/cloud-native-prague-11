# Tanka: for those who hate stirng templating but don't mind braces

This repository contains all resources for my talk at [Cloud Native Prague
meetup #11][cnp11].


# Slides

The slides used during the presentation are in `slides.org`. This is [Emacs Org
mode][org] file which is similar to Markdown and can be read with any text
processor if you don't have text editor with Org mode at hand.


# Examples
 
There are also targets for building the `02-jsonnet-embed/`
`03-jsonenet-native-functions/` and Go examples:

```shell
```


# Playground 

This repository uses [Nix Flakes direnv setup][nix-direnv]. If you want to run
the examples without Nix you can find a list of needed packages in `Flake.nix`
file.

Wile [k3d][k3d] is the chosen local dev cluster setup, the examples can be
tested against any Kuernetes cluster. The only requirement to run the examples
is Kubernets >= 1.27.

The k3d setup relies on container runtime which the Flake.nix does not install.
By default this is Docker. See [k3d docs][k3d] for alternatives.

The `Makefile` included in this repository provides targets for bringing up a
testing k3d cluster:

```shell
# To start the local k3d cluster
make k3d-up

# To cleanup the local k3d cluster
make k3d-clean
```


[cnp11]: https://community.cncf.io/events/details/cncf-cloud-native-prague-presents-cloud-native-prague-11/
[k3d]: https://k3d.io/
[nix-direnv]: https://nix.dev/guides/recipes/direnv.html
[org]: https://orgmode.org/

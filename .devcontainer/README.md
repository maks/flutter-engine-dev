# Docker container to do Flutter Engine development that works with VSCode Remote-Containers

This is my "workspace" for doing Flutter engine development inside a Docker container. 

It came about because when I first needed to contribute to the Flutter Engine it only supported upto Ubuntu 18.04 whereas I was already running Ubuntu 20.04 and Debian Buster as my daily development environments.



## Setup

Apart from whats in this repo, I first has to do:

* Install Docker engine on my host machine. On Debian I followed [instructions on the docker site](https://docs.docker.com/engine/install/debian/).
* I like to run as non root user so I then did: `sudo usermod -aG docker my-username`
* Install the `Docker` and `Remote-Containers` extensions in VS Code.

## References

I based my Docker file and devcontainer.json initially on the ones [from this article](https://blog.codemagic.io/how-to-dockerize-flutter-apps/), though I heavily modified it to remove things that were not relevant to building the Flutter engine as well as adding things that were required.

[Detailed instructions](https://code.visualstudio.com/docs/remote/containers) about how the VSC Remote-Containers extension works.

## Handy items for building the flutter engine

[per building docs](https://github.com/flutter/flutter/wiki/Compiling-the-engine):


once inside the container, to build for linux desktop on linux:
```
export PATH=~/workspace/depot_tools:$PATH
cd src
ninja -C out/host_debug_unopt
```


## Handy items for testing the flutter engine

since I use fvm, to run flutter app in a dir alongside this repo with the newly built custom engine (**outside the container**):

```
fvm flutter 
--local-engine-src-path ../flutter-engine-dev/engine/src --local-engine=android_debug_unopt -d linux run
```
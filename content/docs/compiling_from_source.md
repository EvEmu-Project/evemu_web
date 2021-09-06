+++
title = "Compiling From Source"
description = "How to compile EVEmu from source."
date = 2021-03-21T16:35:23+01:00
weight = 20
draft = true
bref = "How to compile EVEmu from source."
toc = true
+++

### Docker

The EVEmu repository now contains a Dockerfile to increase ease of compilation. In order to compile using the Dockerfile, all you need is to have Docker or Podman installed on your system, and run the following commands:

**NOTE:** If you are using Podman instead of Docker, simply replace the `docker` commands with `podman`. 

```
cd evemu_server
docker build .
```

Once this process completes, you will have a container which you can then run with

```
docker run <container name>
```

### Direct Compilation

This procedure describes how to compile EVEmu directly on your system. Compiling this way is helpful when debugging or developing EVEmu.

### Obtain Dependencies

To compile EVEmu on your system, you must have the following:

* GCC
* zlib
* cmake
* git
* boost (1.7x now supported)
* libmariadb
* tinyxml

If you do not have these prerequisites, our cmake scripts will attempt to download them for you.

If you are on Debian or Ubuntu, you run the following to install the required packages:

```
apt install -y build-essential cmake git zlib1g-dev libmariadbclient-dev libboost-all-dev libutfcpp-dev libtinyxml-dev libmariadb-dev-compat
```

### Configure EVEmu

This project uses CMake to configure source for compilation. To configure the source, run the following commands from the repository's directory.

```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=dist ..
```

This will create a build drectory and configure the package to be installed in `dist/` in your current directory. If you wish to build a release version or you do not want to install to `dist/`, adjust these parameters to your liking.

### Compile

Finally, we are ready to compile! To build EVEmu, run the following command and wait for the process to complete:

```
make
```

Once this process has completed, you can install the resulting binary and configuration files with the following command:
```
make install
```

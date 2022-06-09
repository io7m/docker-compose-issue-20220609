A plain `docker` build:

```
$ docker build .
Sending build context to Docker daemon   51.2kB
Step 1/2 : FROM debian:11
 ---> 4eacea30377a
Step 2/2 : RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install tinyscheme
 ---> Running in 8f4bd78bc1da
Get:1 http://security.debian.org/debian-security bullseye-security InRelease [44.1 kB]
Get:2 http://deb.debian.org/debian bullseye InRelease [116 kB]
Get:3 http://deb.debian.org/debian bullseye-updates InRelease [39.4 kB]
Get:4 http://security.debian.org/debian-security bullseye-security/main amd64 Packages [153 kB]
Get:5 http://deb.debian.org/debian bullseye/main amd64 Packages [8182 kB]
Get:6 http://deb.debian.org/debian bullseye-updates/main amd64 Packages [2592 B]
Fetched 8537 kB in 3s (2592 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  tinyscheme
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 60.2 kB of archives.
After this operation, 172 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bullseye/main amd64 tinyscheme amd64 1.42.svn.2020.06.04-2 [60.2 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 60.2 kB in 0s (1255 kB/s)
Selecting previously unselected package tinyscheme.
Reading database ... 
Preparing to unpack .../tinyscheme_1.42.svn.2020.06.04-2_amd64.deb ...
Unpacking tinyscheme (1.42.svn.2020.06.04-2) ...
Setting up tinyscheme (1.42.svn.2020.06.04-2) ...
Removing intermediate container 8f4bd78bc1da
 ---> b7b50919a8bf
Successfully built b7b50919a8bf
```

After removing the cached image and trying the same build using `docker-compose`:

```
$ docker-compose up --build
[+] Building 0.4s (5/5) FINISHED                                                                                                                                                                                               
 => [internal] load build definition from Dockerfile                                                                                                                                                                      0.0s
 => => transferring dockerfile: 135B                                                                                                                                                                                      0.0s
 => [internal] load .dockerignore                                                                                                                                                                                         0.0s
 => => transferring context: 2B                                                                                                                                                                                           0.0s
 => [internal] load metadata for docker.io/library/debian:11                                                                                                                                                              0.0s
 => CACHED [1/2] FROM docker.io/library/debian:11                                                                                                                                                                         0.0s
 => ERROR [2/2] RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install tinyscheme                                                                                                                        0.3s
------
 > [2/2] RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install tinyscheme:
#0 0.259 Err:1 http://deb.debian.org/debian bullseye InRelease
#0 0.259   Temporary failure resolving 'deb.debian.org'
#0 0.259 Err:2 http://security.debian.org/debian-security bullseye-security InRelease
#0 0.259   Temporary failure resolving 'security.debian.org'
#0 0.259 Err:3 http://deb.debian.org/debian bullseye-updates InRelease
#0 0.259   Temporary failure resolving 'deb.debian.org'
#0 0.263 Reading package lists...
#0 0.273 W: Failed to fetch http://deb.debian.org/debian/dists/bullseye/InRelease  Temporary failure resolving 'deb.debian.org'
#0 0.273 W: Failed to fetch http://security.debian.org/debian-security/dists/bullseye-security/InRelease  Temporary failure resolving 'security.debian.org'
#0 0.273 W: Failed to fetch http://deb.debian.org/debian/dists/bullseye-updates/InRelease  Temporary failure resolving 'deb.debian.org'
#0 0.273 W: Some index files failed to download. They have been ignored, or old ones used instead.
#0 0.280 Reading package lists...
#0 0.286 Building dependency tree...
#0 0.286 Reading state information...
#0 0.288 E: Unable to locate package tinyscheme
------
failed to solve: executor failed running [/bin/sh -c apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install tinyscheme]: exit code: 100
```

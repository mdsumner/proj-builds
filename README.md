
# proj-builds

<!-- badges: start -->
<!-- badges: end -->

The goal of proj-builds is to provide containers on ubuntu latest for [PROJ](https://proj.org) versions. 

Dockerfiles and github action yaml is templated from PROJ releases (6.3.2, 9.3.1, etc) and from 'latest' (the latest release, which might not yet be in the list we started with) and from 'devel' (the very latest commit on the [PROJ github repo](https://github.com/OSGEO/proj.git)). 

The containers are listed on [packages](https://github.com/mdsumner/proj-builds/pkgs/container/proj-builds).

Run bash in a container like this: 

Specific version: 

```bash
docker run --rm -ti ghcr.io/mdsumner/proj-builds:6.3.2 bash
```


Bleeding edge: 

```bash
docker run --rm -ti ghcr.io/mdsumner/proj-builds:devel bash
```

Latest release: 

```bash
docker run --rm -ti ghcr.io/mdsumner/proj-builds:latest bash
```

## TODO

- set up triggers so that latest and devel are always up to date. 
- automate the boilerplate label list, only change for new ones
- figure out what's wrong with 7.0.0 or remove it

## Code of Conduct
  
Please note that the proj-builds project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.



# proj-builds

<!-- badges: start -->
<!-- badges: end -->

The goal of proj-builds is to provide containers on ubuntu latest for [PROJ](https://proj.org) versions. 

Dockerfiles and github action yaml is templated from PROJ releases (6.3.2, 9.3.1, etc) and from 'latest' (the latest release, which might not yet be in the list we started with) and from 'devel' (the very latest commit on the [PROJ github repo](https://github.com/OSGEO/proj.git)). 

The containers are listed on [packages](https://github.com/mdsumner/proj-builds/pkgs/container/proj-builds).

At time of writing (December 2023) the following labels are available: 


- devel
- latest
- 9.3.1
- 9.3.0
- 9.2.1
- 9.2.0
- 9.1.1
- 9.1.0
- 9.0.1
- 9.0.0
- 8.2.1
- 8.2.0
- 8.1.1
- 8.1.0
- 8.0.1
- 8.0.0
- 7.2.1
- 7.2.0
- 7.1.1
- 7.1.0
- 7.0.1
- 7.0.0:  Not this one, not working for some reason
- 6.3.2
- 6.3.1
- 6.3.0
- 6.2.1
- 6.2.0
- 6.1.1
- 6.1.0
- 6.0.0

Note that this is only in ubuntu latest, so unlikely to reflect system conditions when the lib was current, and we aren't interested in cross-platform atm. This is so we can work on PROJ bindings development in R for >= 6.3.1 and not have to build the lib. 

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


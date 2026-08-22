# Summary

This script `run.sh` is to test the `install.sh` found in the repo root in a isolated environment such as docker

## usage

```shell
$ ./run.sh --keep #this to keep the created docker image file
$ ./run.sh # running this script again will do the test again and remove the existing docker image
```

# Prerequisites

- docker

# Testing manual

to get into the docker image file :

```shell
$ docker exec -it dotfiles-test-keep bash -l
```

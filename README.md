cdnjs-drone-clone
========================

![license](https://img.shields.io/badge/license-GPLv3.0-brightgreen.svg?style=flat)
![](https://img.shields.io/docker/pulls/peterdavehello/cdnjs-drone-clone.svg)
![](https://images.microbadger.com/badges/image/peterdavehello/cdnjs-drone-clone.svg)
![](https://images.microbadger.com/badges/version/peterdavehello/cdnjs-drone-clone.svg)

A [Drone](https://drone.io) CI v0.5 plugin to help we fetch the remote objects on cache git repo instead of clone the repo.

## How to

Use docker image [peterdavehello/cdnjs-drone-clone](https://hub.docker.com/r/peterdavehello/cdnjs-drone-clone/) for clone process, set the **sparseCheckout** value to the file contains the sparseCheckout file list

Reference:
http://readme.drone.io/0.5/usage/customize-clone/

## Example

```yaml
clone:
  image: peterdavehello/drone-git-sparse-checkout
    sparseCheckout: sparseCheckout-list.txt
```

## License

GPL-3.0

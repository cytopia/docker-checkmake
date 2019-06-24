# Docker image for `checkmake`

[![Build Status](https://travis-ci.com/cytopia/docker-checkmake.svg?branch=master)](https://travis-ci.com/cytopia/docker-checkmake)
[![Tag](https://img.shields.io/github/tag/cytopia/docker-checkmake.svg)](https://github.com/cytopia/docker-checkmake/releases)
[![](https://images.microbadger.com/badges/version/cytopia/checkmake:latest.svg)](https://microbadger.com/images/cytopia/checkmake:latest "checkmake")
[![](https://images.microbadger.com/badges/image/cytopia/checkmake:latest.svg)](https://microbadger.com/images/cytopia/checkmake:latest "checkmake")
[![](https://img.shields.io/badge/github-cytopia%2Fdocker--checkmake-red.svg)](https://github.com/cytopia/docker-checkmake "github.com/cytopia/docker-checkmake")
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Docker images
>
> [ansible](https://github.com/cytopia/docker-ansible) **•**
> [ansible-lint](https://github.com/cytopia/docker-ansible-lint) **•**
> [awesome-ci](https://github.com/cytopia/awesome-ci) **•**
> [black](https://github.com/cytopia/docker-black) **•**
> [checkmake](https://github.com/cytopia/docker-checkmake) **•**
> [eslint](https://github.com/cytopia/docker-eslint) **•**
> [file-lint](https://github.com/cytopia/docker-file-lint) **•**
> [gofmt](https://github.com/cytopia/docker-gofmt) **•**
> [golint](https://github.com/cytopia/docker-golint) **•**
> [jsonlint](https://github.com/cytopia/docker-jsonlint) **•**
> [phpcs](https://github.com/cytopia/docker-phpcs) **•**
> [pycodestyle](https://github.com/cytopia/docker-pycodestyle) **•**
> [pylint](https://github.com/cytopia/docker-pylint) **•**
> [terraform-docs](https://github.com/cytopia/docker-terraform-docs) **•**
> [terragrunt](https://github.com/cytopia/docker-terragrunt) **•**
> [tflint](https://github.com/cytopia/docker-tflint) **•**
> [yamllint](https://github.com/cytopia/docker-yamllint)


> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Makefiles
>
> Visit **[cytopia/makefiles](https://github.com/cytopia/makefiles)** for seamless project integration, minimum required best-practice code linting and CI.

View **[Dockerfile](https://github.com/cytopia/docker-checkmake/blob/master/Dockerfile)** on GitHub.

[![Docker hub](http://dockeri.co/image/cytopia/checkmake)](https://hub.docker.com/r/cytopia/checkmake)

Tiny Alpine-based multistage-build dockerized version of [checkmake](https://github.com/mrtazz/checkmake)<sup>[1]</sup>,
The image is built nightly against multiple stable versions and pushed to Dockerhub.

<sub>[1] Official project: https://github.com/mrtazz/checkmake</sub>


## Available Docker image versions


| Docker tag | Build from docker-checkmake | Build from checkmake |
|------------|----------------------------------|---------------------------|
| `latest`   | [Branch: master](https://github.com/cytopia/docker-checkmake) | [Branch: master](https://github.com/mrtazz/checkmake) |
| `0.1.0`    | [Branch: master](https://github.com/cytopia/docker-checkmake) | [Tag: 0.1.0](https://github.com/mrtazz/checkmake/tree/0.1.0) |


## Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted locally to
where your Terraform module is located.


## Usage

### Generic
```bash
# Lint a single Makefile
docker run --rm -v $(pwd):/data cytopia/checkmake Makefile

# Lint all available Makefiles
docker run --rm -v $(pwd):/data --entrypoint=find cytopia/checkmake . -name Makefile -exec checkmake {} \;
```

### Configuration

If you want to change the behaviour of `checkmake`, you can add `checkmake.ini` to the root of your
mount location and adjust the linter settings:
```ini
[maxbodylength]
maxBodyLength = 10

[minphony]
disabled = true
```


## Related [#awesome-ci](https://github.com/topics/awesome-ci) projects

### Docker images

Save yourself from installing lot's of dependencies and pick a dockerized version of your favourite
linter below for reproducible local or remote CI tests:

| Docker image | Type | Description |
|--------------|------|-------------|
| [awesome-ci](https://github.com/cytopia/awesome-ci) | Basic | Tools for git, file and static source code analysis |
| [file-lint](https://github.com/cytopia/docker-file-lint) | Basic | Baisc source code analysis |
| [jsonlint](https://github.com/cytopia/docker-jsonlint) | Basic | Lint JSON files |
| [yamllint](https://github.com/cytopia/docker-yamllint) | Basic | Lint Yaml files |
| [ansible](https://github.com/cytopia/docker-ansible) | Ansible | Multiple versoins of Ansible |
| [ansible-lint](https://github.com/cytopia/docker-ansible-lint) | Ansible | Lint  Ansible |
| [gofmt](https://github.com/cytopia/docker-gofmt) | Go | Format Go source code |
| [golint](https://github.com/cytopia/docker-golint) | Go | Lint Go code |
| [eslint](https://github.com/cytopia/docker-eslint) | Javascript | Lint Javascript code |
| [checkmake](https://github.com/cytopia/docker-checkmake) | Make | Lint Makefiles |
| [phpcs](https://github.com/cytopia/docker-phpcs) | PHP | PHPCodeSniffer and Code Beautifier and Fixer |
| [black](https://github.com/cytopia/docker-black) | Python | The uncompromising Python code formatter |
| [pycodestyle](https://github.com/cytopia/docker-pycodestyle) | Python | Python style guide checker |
| [pylint](https://github.com/cytopia/docker-pylint) | Python | Python source code, bug and quality checker |
| [terraform-docs](https://github.com/cytopia/docker-terraform-docs) | Terraform | Terraform doc generator (TF 0.12 ready) |
| [terragrunt](https://github.com/cytopia/docker-terragrunt) | Terraform | Terragrunt and Terraform |
| [tflint](https://github.com/cytopia/docker-tflint) | Terraform | Best-practice Terraform linter |


### Makefiles

Visit **[cytopia/makefiles](https://github.com/cytopia/makefiles)** for dependency-less, seamless project integration and minimum required best-practice code linting for CI.
The provided Makefiles will only require GNU Make and Docker itself removing the need to install anything else.


## License

**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)

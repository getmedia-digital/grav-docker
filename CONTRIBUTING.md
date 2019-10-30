# Contribute to GRAV CMS Docker

[GRAV CMS](https://getgrav.org/) is an open-source CMS developed by [Trilby Media](http://trilbymedia.com/). GRAV CMS Docker is an open-source project brought & maintained by [GET Media Digital](https://getmedia.digital) that helps to bring up your GRAV=based project to Docker environment and helps you make proper orchestration for your production environment. 


## Open Development & Community Driven

As GRAV is open-source, we provide this docker as open-source as well. All the work done is available on GitHub. 

The core team and the contributors send pull requests which go through the same validation process.

## Feature Requests

Feel free to raise any feature request via [GitHub Issues](https://github.com/getmedia-digital/grav-docker/issues).

## Code of Conduct

By participating on this project, you are expected to uphold [GRAV CMS Docker Code of Conduct](CODE_OF_CONDUCT.md) and [GRAV Code of Conduct](https://github.com/getgrav/grav/blob/develop/CODE_OF_CONDUCT.md) 

## Bugs

We are using [GitHub Issues](https://github.com/getmedia-digital/grav-docker/issues) for bug tracking. Feel free to [report](https://github.com/getmedia-digital/grav-docker/issues/new) any bug any time. 

---

## Before Submitting a Pull Request

* Build the Docker container
* Try to run GRAV CMS container, ensure if GRAV site is available.

## Contribution Prerequisites

* You have installed Docker up to date with latest stable version
* You are familiar with Git

## Development Workflow

#### 1. Create a Feature Request if it does not exist already

Follow [this section](#feature-requests).

#### 2. Clone the repository

```bash
git clone git@github.com:getmedia-digital/grav-docker.git
```

#### 3. Create new branch

Please respect the git flow while naming your branch, e.g. bugfix/{issue-id}, feature/{my-awesome-feature-issue-id}.

#### 4. Try to build the image

Run this command in project root

```bash
docker build . -t grav-cms
```

**You are now able to contribute!**

## Miscellaneous

### Repository Organization

All the configs and scripts for Docker image are located in `.docker/{package-name}`.

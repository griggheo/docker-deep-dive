# docker-deep-dive
Deep Dive into Docker Containers and DevSecOps pipelines

# Part 1
## Using Taskfiles for local pipelines

* Task: https://taskfile.dev/#/
* https://dev.to/stack-labs/introduction-to-taskfile-a-makefile-alternative-h92

## Building curated Docker images

* https://github.com/codepraxis-io/docker-deep-dive/tree/main/taskfiles/build-curated-docker-images
* https://github.com/orgs/codepraxis-io/packages/container/package/ubuntu22.04
* https://github.com/orgs/codepraxis-io/packages/container/package/alpine3.16

## Building a Java SpringBoot app and creating Docker images based on various base images

* https://github.com/codepraxis-io/docker-deep-dive/blob/main/taskfiles/build-app-java/Taskfile.yaml

Dockerfiles:

* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.amazoncorretto-17-alpine3-15
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.eclipse-temurin-17-jre-jammy
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.distroless-java17-debian11
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.distroless-java17-debian11-multistage
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.distroless-java11-debian11-multistage
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.curated-alpine3.16-openjdk17

Docker image build mechanisms:

* Docker Buildx: https://github.com/docker/buildx
* Kaniko: https://github.com/GoogleContainerTools/kaniko
* Cloud Native Buildpacks: https://buildpacks.io/ and https://paketo.io/
* Buildah: https://github.com/containers/buildah (also Podman https://github.com/containers/podman)
* Jib: https://github.com/GoogleContainerTools/jib

Inspecting and manipulating Docker images:

* Crane: https://github.com/google/go-containerregistry/tree/main/cmd/crane
* Skopeo: https://github.com/containers/skopeo
* Dive: https://github.com/wagoodman/dive

See also https://github.com/iximiuz/awesome-container-tinkering for more resources.

# Part 2

## Scanning Docker images for security vulnerabilities

* Trivy: 


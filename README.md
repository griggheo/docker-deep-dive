# docker-deep-dive
Deep Dive into Docker Containers and DevSecOps pipelines

## Part 1 - Building and interacting with Docker images

### Using Taskfiles for local pipelines

* Task: https://taskfile.dev/#/
* https://dev.to/stack-labs/introduction-to-taskfile-a-makefile-alternative-h92

### Building curated Docker images

* https://github.com/codepraxis-io/docker-deep-dive/tree/main/taskfiles/build-curated-docker-images
* https://github.com/orgs/codepraxis-io/packages/container/package/ubuntu22.04
* https://github.com/orgs/codepraxis-io/packages/container/package/alpine3.16

### Building a Java SpringBoot app and creating Docker images based on various base images

* https://github.com/codepraxis-io/docker-deep-dive/blob/main/taskfiles/build-app-java/Taskfile.yaml

Dockerfiles:

* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.amazoncorretto-17-alpine3-15
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.eclipse-temurin-17-jre-jammy
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.distroless-java17-debian11
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.distroless-java17-debian11-multistage
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.distroless-java11-debian11-multistage
* https://github.com/codepraxis-io/spring-music/blob/master/Dockerfile.curated-alpine3.16-openjdk17

Docker images available to use as base images:

* Distroless: https://github.com/GoogleContainerTools/distroless
  * https://iximiuz.com/en/posts/containers-distroless-images/
* Distroless vs alpine: https://itnext.io/which-container-images-to-use-distroless-or-alpine-96e3dab43a22

Docker image build mechanisms:

* Docker Buildx: https://github.com/docker/buildx
* Kaniko: https://github.com/GoogleContainerTools/kaniko
* Cloud Native Buildpacks: https://buildpacks.io/
  * https://paketo.io/
  * https://paketo.io/docs/howto/java/
* Nerdctl: https://github.com/containerd/nerdctl
  * https://medium.com/nttlabs/nerdctl-359311b32d0e
* Podman https://github.com/containers/podman
  * Buildah: https://github.com/containers/buildah
  * https://developers.redhat.com/blog/2020/09/25/rootless-containers-with-podman-the-basics
  * https://podman.io/blogs/2018/10/31/podman-buildah-relationship.html
* Jib: https://github.com/GoogleContainerTools/jib
  * https://github.com/GoogleContainerTools/jib/blob/master/docs/faq.md
  * https://snyk.io/blog/building-java-container-images-using-jib/


Inspecting and manipulating Docker images:

* Dive: https://github.com/wagoodman/dive
* Crane: https://github.com/google/go-containerregistry/tree/main/cmd/crane
* ORAS: https://github.com/oras-project/oras
* Skopeo: https://github.com/containers/skopeo
* https://itnext.io/reverse-engineer-docker-images-into-dockerfiles-453d3d21d896

Other resources:

* https://lwn.net/Articles/902049/
* https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci/
* https://containers.gitbook.io/build-containers-the-hard-way/
* https://github.com/iximiuz/awesome-container-tinkering
* https://iximiuz.com/en/posts/docker-debug-slim-containers/
* https://ashishtechmill.com/comparing-modern-day-container-image-builders-jib-buildpacks-and-docker

KO

* https://snyk.io/blog/container-images-simplified-with-google-ko/

Creating a new SpringBoot application: https://start.spring.io/

## Part 2 - Docker image security

### Scanning Dockerfiles for security vulnerabilities

* Trivy: https://github.com/aquasecurity/trivy
* Semgrep: https://semgrep.dev/docs/

### Scanning Docker images for security vulnerabilities

* Trivy
* Grype: https://github.com/anchore/grype

### Generating SBOMs from Docker images

* Trivy
* Syft: https://github.com/anchore/syft
  * Syft and Grype: https://medium.com/rahasak/container-vulnerability-scan-with-syft-and-grype-f4ec9cd4d7f1

### Generating CycloneDX and SPDX SBOMs from code

* CycloneDX
  https://github.com/CycloneDX/cyclonedx-python
* SPDX
  * https://github.com/microsoft/sbom-tool
  * https://security.googleblog.com/2022/06/sbom-in-action-finding-vulnerabilities.html
  * https://github.com/spdx/spdx-to-osv/

More SBOM resources
* https://mergebase.com/blog/best-tools-for-generating-sbom/
* https://github.com/opensbom-generator/spdx-sbom-generator
* https://pedrodelgallego.github.io/blog/engineering/capabilities/security/software-bill-of-materials-devsecops/
* https://github.com/devops-kung-fu/bomber

### Signing Docker images and verifying signatures

* Cosign: https://github.com/sigstore/cosign

### Attesting artifacts

* in-toto: https://in-toto.io/
  * https://github.com/in-toto/attestation
* https://anchore.com/sbom/creating-sbom-attestations-using-syft-and-sigstore/
* OCI as attestations storage for your packages: https://nextjs.marcofranssen.nl/oci-as-attestations-storage-for-your-packages

### Safeguarding artifact integrity (SLSA)

* SLSA: https://slsa.dev/
* SLSA guide: https://fossa.com/blog/practical-guide-slsa-framework/
* SLSA verifier: https://github.com/slsa-framework/slsa-verifier
* Google Distroless achieves SLSA level 2: https://www.infoq.com/news/2022/10/distroless-slsa-level-two/
* VEX: https://cloud.google.com/blog/products/identity-security/how-vex-helps-sbomslsa-improve-supply-chain-visibility

Other resources:
* Microsoft's Open Source Software (OSS) Secure Supply Chain (SSC) Framework: https://github.com/microsoft/oss-ssc-framework

### Chainguard ecosystem

* Wolfi: https://github.com/wolfi-dev/os
* Apko: https://github.com/chainguard-dev/apko
* Melange: https://github.com/chainguard-dev/melange

## Part 3 - GitHub Actions Workflows for Docker image creation and publishing

### GitHub Actions Reusable Workflows

* Reusable workflows and reusable actions
* Types of triggers (branch, tag, release)
* https://docs.github.com/en/actions/using-workflows/reusing-workflows
* https://betterprogramming.pub/how-to-use-github-actions-reusable-workflow-8604e8cbf258

### GitHub Actions and SLSA

* Generation of SLSA3+ provenance for native GitHub projects: https://github.com/slsa-framework/slsa-github-generator
* https://security.googleblog.com/2022/04/improving-software-supply-chain.html
* https://github.com/slsa-framework/github-actions-demo
* https://marcofranssen.nl/secure-your-software-supply-chain-using-sigstore-and-github-actions
* https://github.com/philips-labs/slsa-provenance-action

## Extra material

* Running Dependency Track for inspecting SBOMs: https://dependencytrack.org/
  * https://medium.com/geekculture/oss-vulnerability-detection-from-sbom-with-ci-cd-for-js-applications-4edcdfba499d
* Running local Kubernetes clusters with kind: https://kind.sigs.k8s.io/
* Running a local Docker registry in kind: https://kind.sigs.k8s.io/docs/user/private-registries/
oss-vulnerability-detection-from-sbom-with-ci-cd-for-js-applications-4edcdfba499d
* Kyverno policies for allowing only signed images to run in kind: https://kyverno.io/docs/writing-policies/verify-images/
* https://nirmata.com/2022/09/29/how-to-migrate-from-kubernetes-pod-security-policies-to-kyverno/
* kbld: https://carvel.dev/kbld/
  * https://medium.com/@michael.vittrup.larsen/why-we-should-use-latest-tag-on-container-images-fc0266877ab5

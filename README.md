# Deep Dive into Docker Containers and DevSecOps pipelines

## Part 1 - Building and interacting with Docker images

**Using Taskfiles for local pipelines**

* Task: https://taskfile.dev/#/
* https://dev.to/stack-labs/introduction-to-taskfile-a-makefile-alternative-h92

**Building curated Docker images**

* https://github.com/codepraxis-io/curated-docker-images
* https://github.com/orgs/codepraxis-io/packages/container/package/ubuntu22.04
* https://github.com/orgs/codepraxis-io/packages/container/package/alpine3.16

**Building a Java SpringBoot app and creating Docker images based on various base images**

* https://github.com/codepraxis-io/docker-deep-dive/blob/main/taskfiles/build-java-gradle-spring-music/Taskfile.yaml

**Dockerfiles**

Java SpringBoot / Gradle app:
* https://github.com/codepraxis-io/spring-music

Java SpringBoot / Maven app:
* https://github.com/codepraxis-io/dddive-springboot

Python Flask app:
* https://github.com/codepraxis-io/flask-bootstrap


**Docker images available to use as base images**

* Distroless: https://github.com/GoogleContainerTools/distroless
  * https://iximiuz.com/en/posts/containers-distroless-images/
* Distroless vs alpine: https://itnext.io/which-container-images-to-use-distroless-or-alpine-96e3dab43a22

**Docker image build mechanisms**

* Docker Buildx: https://github.com/docker/buildx
* Kaniko: https://github.com/GoogleContainerTools/kaniko
* Cloud Native Buildpacks: https://buildpacks.io/
  * https://paketo.io/
  * https://paketo.io/docs/howto/java/
* Containerd/nerdctl: https://github.com/containerd/nerdctl
  * https://medium.com/nttlabs/nerdctl-359311b32d0e
  * https://earthly.dev/blog/containerd-vs-docker/
* Podman https://github.com/containers/podman
  * Buildah: https://github.com/containers/buildah
  * https://www.redhat.com/en/topics/containers/what-is-podman
  * https://developers.redhat.com/blog/2020/09/25/rootless-containers-with-podman-the-basics
  * https://podman.io/blogs/2018/10/31/podman-buildah-relationship.html
* Jib: https://github.com/GoogleContainerTools/jib
  * https://github.com/GoogleContainerTools/jib/blob/master/docs/faq.md
  * https://snyk.io/blog/building-java-container-images-using-jib/
  * Sample app built with Jib: https://github.com/codepraxis-io/springboot-helloworld


**Inspecting and manipulating Docker images**

* Dive: https://github.com/wagoodman/dive
* Crane: https://github.com/google/go-containerregistry/tree/main/cmd/crane
* ORAS: https://github.com/oras-project/oras
* Skopeo: https://github.com/containers/skopeo

* DockerHub OCI Artifact support: https://www.docker.com/blog/announcing-docker-hub-oci-artifacts-support/

**Other resources**

* https://github.com/iximiuz/awesome-container-tinkering
* https://iximiuz.com/en/series/debunking-container-myths/
* https://github.com/iximiuz/cdebug

* Earthly https://earthly.dev
  * https://earthly.dev/blog/chroot/

* http://jpetazzo.github.io/2017/02/24/from-dotcloud-to-docker/
* https://jpetazzo.github.io/2020/02/01/quest-minimal-docker-images-part-1/
* https://lwn.net/Articles/902049/
* https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci/
* https://containers.gitbook.io/build-containers-the-hard-way/
* https://iximiuz.com/en/posts/docker-debug-slim-containers/
* https://blog.kubesimplify.com/the-secret-gems-behind-building-container-images-enter-buildkit-and-docker-buildx
* https://ashishtechmill.com/comparing-modern-day-container-image-builders-jib-buildpacks-and-docker
* https://dlorenc.medium.com/oci-artifacts-explained-8f4a77945c13
* https://itnext.io/reverse-engineer-docker-images-into-dockerfiles-453d3d21d896
* https://medium.com/geekculture/create-docker-images-without-docker-daemon-kaniko-847a688155a6


Creating a new SpringBoot application: https://start.spring.io/

Go ecosystem:

* Ko: https://github.com/ko-build/ko 
  * https://snyk.io/blog/container-images-simplified-with-google-ko/
* goreleaser: https://github.com/goreleaser/goreleaser
  * goreleaser supply chain example: https://github.com/goreleaser/supply-chain-example
* podinfo: https://github.com/stefanprodan/podinfo

Kubernetes-in-a-box

* KIND: https://kind.sigs.k8s.io/
  * Running a local Docker registry in kind: https://kind.sigs.k8s.io/docs/user/private-registries/
* microk8s: https://microk8s.io/

## Part 2 - Docker image security

**Vulnerability databases**

* "Common Vulnerabilities and Exposures" aka CVE: https://cve.mitre.org/cve/search_cve_list.html
* "National Vulnerability Database" aka NVD: https://nvd.nist.gov/
* https://osv.dev/

**Scanning Dockerfiles for security vulnerabilities**

* Trivy: https://github.com/aquasecurity/trivy
* Semgrep: https://semgrep.dev/docs/

**Scanning Docker images for security vulnerabilities**

* Trivy
* Grype: https://github.com/anchore/grype
* SARIF format: https://sarifweb.azurewebsites.net/

**Generating SBOMs from Docker images**

* Trivy
* Syft: https://github.com/anchore/syft
  * Syft and Grype: https://medium.com/rahasak/container-vulnerability-scan-with-syft-and-grype-f4ec9cd4d7f1

**Generating CycloneDX and SPDX SBOMs from code**

* CycloneDX
  https://github.com/CycloneDX/cyclonedx-python
* SPDX
  * https://github.com/microsoft/sbom-tool
  * https://security.googleblog.com/2022/06/sbom-in-action-finding-vulnerabilities.html
  * https://github.com/spdx/spdx-to-osv/

**More SBOM resources**

* https://sysdig.com/blog/sbom-101-software-bill-of-materials
* https://mergebase.com/blog/best-tools-for-generating-sbom/
* https://github.com/opensbom-generator/spdx-sbom-generator
* https://pedrodelgallego.github.io/blog/engineering/capabilities/security/software-bill-of-materials-devsecops/
* https://github.com/devops-kung-fu/bomber
* https://github.com/IBM/sbom-utility
* https://paketo.io/docs/howto/sbom/#access-the-software-bill-of-materials-on-a-sample-application

### Signing Docker images and verifying signatures

**Sigstore tools**

* Cosign: https://github.com/sigstore/cosign
* Keyless signing with GitHub Actions:
 * https://www.chainguard.dev/unchained/zero-friction-keyless-signing-with-github-actions
 * https://github.com/codepraxis-io/keyless-cosign
* Python sigstore module: 
 * https://github.com/sigstore/sigstore-python
 * https://www.python.org/download/sigstore/
* https://blog.trailofbits.com/2022/11/08/sigstore-code-signing-verification-software-supply-chain/
 

**Attesting artifacts**

* in-toto: https://in-toto.io/
  * https://github.com/in-toto/attestation
* https://anchore.com/sbom/creating-sbom-attestations-using-syft-and-sigstore/
* OCI as attestations storage for your packages: https://nextjs.marcofranssen.nl/oci-as-attestations-storage-for-your-packages

**Chainguard ecosystem**

* Wolfi: https://github.com/wolfi-dev/os
* Apko: https://github.com/chainguard-dev/apko
* Melange: https://github.com/chainguard-dev/melange

## Part 3 - GitHub Actions Workflows for Docker image creation and publishing

**GitHub Actions Reusable Workflows**

* Reusable workflows and reusable actions
* Types of triggers (branch, tag, release)
* https://docs.github.com/en/actions/using-workflows/reusing-workflows
* https://betterprogramming.pub/how-to-use-github-actions-reusable-workflow-8604e8cbf258

**Safeguarding artifact integrity (SLSA)**

* SLSA: https://slsa.dev/
* SLSA guide: https://fossa.com/blog/practical-guide-slsa-framework/
* SLSA verifier: https://github.com/slsa-framework/slsa-verifier
* Google Distroless achieves SLSA level 2: https://www.infoq.com/news/2022/10/distroless-slsa-level-two/
* VEX: https://cloud.google.com/blog/products/identity-security/how-vex-helps-sbomslsa-improve-supply-chain-visibility
* SLSA and GUAC: https://github.com/guacsec/guac
* https://slsa.dev/blog/2022/08/slsa-github-workflows-generic-ga
* https://slsa.dev/blog/2022/05/slsa-sbom

**GitHub Actions and SLSA**

* Generation of SLSA3+ provenance for native GitHub projects: https://github.com/slsa-framework/slsa-github-generator
* https://security.googleblog.com/2022/04/improving-software-supply-chain.html
* https://github.com/slsa-framework/github-actions-demo
* https://marcofranssen.nl/secure-your-software-supply-chain-using-sigstore-and-github-actions
* https://github.com/philips-labs/slsa-provenance-action
* Example of using SLSA GitHub Action Workflows: https://github.com/codepraxis-io/katana

## Extra material

* Microsoft's Open Source Software (OSS) Secure Supply Chain (SSC) Framework: https://github.com/microsoft/oss-ssc-framework
* Running Dependency Track for inspecting SBOMs: https://dependencytrack.org/
* Kyverno policies for allowing only signed images to run in kind: https://kyverno.io/docs/writing-policies/verify-images/
  * https://nirmata.com/2022/09/29/how-to-migrate-from-kubernetes-pod-security-policies-to-kyverno/
* Carvel suite of tools: https://carvel.dev/
* Build reproducibility: https://buildpacks.io/docs/features/reproducibility/
  * https://medium.com/@michael.vittrup.larsen/why-we-should-use-latest-tag-on-container-images-fc0266877ab5
* CNI: https://medium.com/geekculture/k8s-network-cni-introduction-b035d42ad68f
* DevSecOps with GitHub security: https://learn.microsoft.com/en-us/azure/architecture/solution-ideas/articles/devsecops-in-github

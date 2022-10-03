FROM ghcr.io/codepraxis-io/ubuntu22.04:base

ENV DEBIAN_FRONTEND=noninteractive
ENV go_version=1.18.6
ENV cosign_version=1.12.1
ENV crane_version=0.11.0
ENV ko_version=0.12.0

USER root

# install go
#RUN \
#curl -L https://golang.org/dl/go${go_version}.linux-amd64.tar.gz -o /tmp/go${go_version}.linux-amd64.tar.gz \
#&& tar -C /usr/local -xzf /tmp/go${go_version}.linux-amd64.tar.gz \
#&& mv /usr/local/go /usr/local/go${go_version} \
#&& ln -snf /usr/local/go${go_version}/bin/go /usr/local/bin/go

# install cosign
RUN \
cd /tmp \
&& wget "https://github.com/sigstore/cosign/releases/download/v${cosign_version}/cosign-linux-amd64" \
&& mv cosign-linux-amd64 /usr/local/bin/cosign \
&& chmod +x /usr/local/bin/cosign

# install crane and gcrane
RUN \
mkdir -p /tmp/crane \
&& cd /tmp/crane \
&& curl -sL "https://github.com/google/go-containerregistry/releases/download/v${crane_version}/go-containerregistry_Linux_x86_64.tar.gz" > go-containerregistry.tar.gz \
&& tar xvfz go-containerregistry.tar.gz \
&& mv *crane /usr/local/bin \
&& crane version \
&& gcrane version \
&& cd /tmp \
&& rm -rf crane

# install ko
RUN \
mkdir -p /tmp/ko \
&& cd /tmp/ko \
&& curl -sL "https://github.com/ko-build/ko/releases/download/v${ko_version}/ko_${ko_version}_Linux_x86_64.tar.gz" > ko.tar.gz \
&& tar xvfz ko.tar.gz \
&& mv ko /usr/local/bin \
&& ko version \
&& cd /tmp \
&& rm -rf ko

# install trivy
RUN \
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add - \
&& echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | tee -a /etc/apt/sources.list.d/trivy.list \
&& apt-get update \
&& apt-get install trivy

# install semgrep
RUN \
apt-get install -y python3-pip \
&& python3 -m pip install semgrep

# install grype
RUN \
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin \
&& chmod +x /usr/local/bin/grype
    
# install syft
RUN \
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin \
&& chmod +x /usr/local/bin/syft

# Add $HOME/go/bin to $PATH
RUN \
echo 'PATH=$PATH:$HOME/go/bin' >> /root/.bashrc

# Cleanup
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Switch to non-root user
#USER devsecops

FROM ghcr.io/codepraxis-io/ubuntu22.04:base

ENV DEBIAN_FRONTEND=noninteractive

USER root

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

# Cleanup
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Switch to non-root user
#USER devsecops

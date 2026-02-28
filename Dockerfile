# KiCad with InteractiveHtmlBom plugin

FROM kicad/kicad:9.0

ARG IBOM_VERSION=2.10.0

ENV DEBIAN_FRONTEND=noninteractive

# Install python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Install InteractiveHtmlBOM
# https://github.com/openscopeproject/InteractiveHtmlBom/wiki/Tips-and-Tricks
RUN apt-get update -qq && \
    apt-get install -y xvfb && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install --break-system-packages InteractiveHtmlBom==${IBOM_VERSION}

CMD ["bash"]

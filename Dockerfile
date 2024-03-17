# Dockerfile
# Aims to build up a Docker image with the following steps:

# Layer 1: OS, system, and software dependencies
FROM rocker/r-ver:4.3.2

# Layer 2: Software

# Particular system libraries for R packages
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libfontconfig1-dev \
    libpoppler-cpp-dev

# Environment variables
ENV DEFAULT_USER=rstudio
ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=2023.12.0+369
ENV PANDOC_VERSION=3.1.12.2
ENV QUARTO_VERSION=1.4.551

# Install RStudio, Pandoc, and Quarto (versions)
RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh
RUN /rocker_scripts/install_quarto.sh

# Change to default user
USER $DEFAULT_USER

# Layer 3: R packages
RUN R -e "install.packages(c('renv', 'tinytex'), repos = 'https://cran.rstudio.com')"

# Install TinyTeX
# Conditionally run commands based on architecture
RUN if [ "$(uname -m)" = "x86_64" ]; then \
      quarto install tinytex; \
    elif [ "$(uname -m)" = "aarch64" ]; then \
      R -e "tinytex::install_tinytex()"; \
    fi

# Layer 4: Finalize the image
USER root

# Allow sudo access
ENV ROOT=true

# Container port
EXPOSE 8787

# On container start, run the init system
CMD ["/init"]

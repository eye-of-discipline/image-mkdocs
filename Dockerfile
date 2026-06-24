FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    jq \
    yq \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir \
    mkdocs==1.6.0 \
    mkdocs-material==9.5.28 \
    mkdocs-material-extensions==1.3.1 \
    mkdocs-static-i18n[material]==1.3.1 \
    mkdocs-same-dir==0.1.2 \
    mike==2.0.0 \
    pymdown-extensions==10.7 \
    mkdocs-mermaid2-plugin==1.1.1 \
    mkdocs-awesome-pages-plugin==2.9.2 \
    mkdocs-git-revision-date-localized-plugin==1.2.6 \
    mkdocs-glightbox==0.3.7 \
    mkdocs-minify-plugin==0.8.0 \
    mkdocs-macros-plugin==1.0.5 \
    mkdocs-pdf-export-plugin==0.5.10 \
    mkdocs-monorepo-plugin==1.1.0 \
    mkdocs-redirects==1.2.1 \
    mkdocs-changelog-plugin==0.1.3 \
    Pygments==2.17.2

# Create docs directory
RUN mkdir -p /app/docs /app/site

# Default command
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]

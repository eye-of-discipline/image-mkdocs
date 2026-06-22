# MkDocs Docker Image

Production-ready Docker image for building and serving MkDocs documentation with comprehensive extension support and versioning via Mike.

---

## Features

- ✅ **MkDocs** with Material theme
- ✅ **Mike** for documentation versioning
- ✅ **Material Extensions** with advanced features
- ✅ **Mermaid** diagram support
- ✅ **PDF export** capabilities
- ✅ **Git-based revision tracking**
- ✅ **Advanced syntax highlighting** with Pygments
- ✅ **Multiple plugin ecosystem**

---

## Included Extensions

### Core
- mkdocs >= 1.6.0
- mkdocs-material >= 9.5.0
- mkdocs-material-extensions >= 1.3.0
- mike >= 2.0.0

### Formatting & Markup
- pymdown-extensions >= 10.7.0
- Pygments >= 2.17.0

### Features & Plugins
- mkdocs-mermaid2-plugin (diagrams & flowcharts)
- mkdocs-awesome-pages-plugin (navigation)
- mkdocs-git-revision-date-localized-plugin (version history)
- mkdocs-glightbox (image gallery)
- mkdocs-minify-plugin (optimization)
- mkdocs-macros-plugin (templating)
- mkdocs-pdf-export-plugin (PDF generation)
- mkdocs-monorepo-plugin (multi-repo docs)
- mkdocs-redirects (URL redirects)
- mkdocs-changelog-plugin (changelog generation)
- mkdocs-same-dir (same-directory docs)

---

## Quick Start

### Using Docker Compose (Local Development)

```bash
docker-compose up
```

Access MkDocs at `http://localhost:8000`

### Using Docker Directly

Build the image:

```bash
docker build -t mkdocs-app .
```

Run development server:

```bash
docker run -it --rm \
  -v $(pwd)/docs:/app/docs \
  -v $(pwd)/mkdocs.yml:/app/mkdocs.yml \
  -p 8000:8000 \
  mkdocs-app
```

Run build:

```bash
docker run -it --rm \
  -v $(pwd)/docs:/app/docs \
  -v $(pwd)/mkdocs.yml:/app/mkdocs.yml \
  -v $(pwd)/site:/app/site \
  mkdocs-app mkdocs build
```

### Using from GitHub Container Registry

```bash
docker pull ghcr.io/YOUR_ORG/image-mkdocs:latest

docker run -it --rm \
  -v $(pwd)/docs:/app/docs \
  -v $(pwd)/mkdocs.yml:/app/mkdocs.yml \
  -p 8000:8000 \
  ghcr.io/YOUR_ORG/image-mkdocs:latest
```

---

## Documentation Versioning with Mike

Deploy versioned docs to GitHub Pages:

```bash
docker run -it --rm \
  -v $(pwd)/docs:/app/docs \
  -v $(pwd)/mkdocs.yml:/app/mkdocs.yml \
  -v $(pwd)/site:/app/site \
  -e GIT_AUTHOR_NAME="CI" \
  -e GIT_AUTHOR_EMAIL="ci@example.com" \
  mkdocs-app \
  mike deploy 1.0
```

List all versions:
```bash
mike list
```

Set default version:

```bash
mike set-default 1.0
```

---

## CI/CD Pipeline

The included GitHub Actions workflow (`docker-build.yml`) automatically:

- Builds the Docker image on push to main
- Publishes to GitHub Container Registry
- Tags with branch, version, and latest
- Caches layers for faster builds

---

## Project Structure

```bash
.
├── Dockerfile                           # Container definition
├── .dockerignore                        # Docker build exclusions
├── docker-compose.yml                   # Development environment
├── .github/workflows/docker-build.yml   # CI/CD pipeline
├── README.md                            # This file
└── docs/                                # Documentation source (mount point)
    └── mkdocs.yml                       # MkDocs configuration
```

---

## Configuration

Create `mkdocs.yml` in your docs directory:

```yaml
site_name: My Documentation
theme:
  name: material
  features:
    - navigation.instant
    - content.code.copy

plugins:
  - search
  - mermaid2
  - git-revision-date-localized
  - glightbox

markdown_extensions:
  - pymdownx.emoji
  - pymdownx.superfences
  - pymdownx.tabbed
```

---

## Environment Variables

- `PYTHONUNBUFFERED=1` - Disable Python output buffering (recommended for logging)
- `GIT_AUTHOR_NAME` / `GIT_AUTHOR_EMAIL` - For Mike versioning commits

---

## Troubleshooting


### Port Already in Use

```bash
docker run -it --rm -p 8001:8000 mkdocs-app
```

### Permission Issues with Volumes

```bash
docker run -it --rm --user $(id -u):$(id -g) \
  -v $(pwd)/docs:/app/docs \
  mkdocs-app
```

### View Python Dependencies

```bash
docker run --rm mkdocs-app pip list
```

---

## License

See [LICENSE](LICENSE) file.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for development, validation, and pull request guidelines.
All project participants must follow the [Code of Conduct](CODE_OF_CONDUCT.md).

---

## Author Information

| ![Maciej Rachuna](https://gitlab.com/uploads/-/system/user/avatar/8161705/avatar.png?width=120px) |
|---------------------------------------------------------------------------------------------------|
| [Maciej Rachuna](https://gitlab.commrachuna)                                                      |

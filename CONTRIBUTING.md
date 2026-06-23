# Contributing

Thank you for contributing to the mkdocs Docker image.

## Local Development

Requirements:

- Git
- Docker with BuildKit support

Create a short-lived branch from `main`. Keep the branch focused and merge it
through a pull request after validation.

## Making Changes

Node.js and npm package versions are pinned in the `Dockerfile`. When updating
them, verify the package's Node.js engine requirements and update the package
list in `README.md`.

## Validation

```bash
docker build --progress=plain -t image-mkdocs:test .
docker run --rm image-mkdocs:test --version
docker run --rm --entrypoint sh image-mkdocs:test -c \
  'node --version && npm --version && git --version'
```

For configuration changes, mount a representative Git repository and run a
dry release:

```bash
docker run --rm -v "$(pwd):/workspace" image-mkdocs:test \
  --dry-run --no-ci
```

## Commits and Pull Requests

Commit messages must follow the
[Conventional Commits](https://www.conventionalcommits.org/) specification.
Pull requests must describe the change, compatibility or image-size impact,
and validation commands that were run.

Merges to `main` run mkdocs and create a version tag from Conventional
Commits. The tag starts a separate workflow that publishes the corresponding
image to GitHub Container Registry. Do not create release tags manually.

By contributing, you agree that your changes are licensed under the terms of
the repository's `LICENSE` file.

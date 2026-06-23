# Contributing

Thank you for contributing to the MkDocs Docker image.

## Before You Start

- Open an issue before making a large or breaking change.
- Keep each pull request focused on one problem.
- Do not include credentials, tokens, generated documentation, or local environment files.

## Local Development

Requirements:

- Git
- Docker with BuildKit support

Clone the repository and create a branch:

```bash
git clone git@github.com:eye-of-discipline/image-mkdocs.git
cd image-mkdocs
git switch -c type/short-description
```

This project follows trunk-based development. The `main` branch is the trunk and must remain releasable. Create short-lived branches from the latest `main`, keep changes small, and merge them through pull requests as soon as they pass review and validation. Avoid long-lived feature, release, or integration branches.

Use a descriptive branch prefix such as `fix/`, `feat/`, or `docs/`. Before opening or updating a pull request, synchronize your branch with the latest `main` and resolve any conflicts.

## Making Changes

Python dependencies are pinned in the `Dockerfile` to keep image builds reproducible. When adding or updating a dependency:

1. Confirm that the package and exact version exist on PyPI.
2. Check compatibility with the Python version used by the base image.
3. Update the included extensions list in `README.md` when applicable.
4. Build and validate the complete image locally.

## Validation

Build the image:

```bash
docker build --progress=plain -t image-mkdocs:test .
```

Check dependency consistency and MkDocs startup:

```bash
docker run --rm image-mkdocs:test sh -c \
  'pip check && mkdocs --version'
```

If your change affects a plugin, also build a representative MkDocs project with that plugin enabled.

## Commits

All commit messages must follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```text
fix: correct changelog plugin version
feat: add a MkDocs extension
docs: clarify container usage
```

Use the format `<type>[optional scope]: <description>`. Common types are `feat`, `fix`, `docs`, `chore`, `refactor`, and `ci`. Add `!` or a `BREAKING CHANGE:` footer for breaking changes.

## Pull Requests

In the pull request description, include:

- what changed and why,
- any compatibility or image-size impact,
- the validation commands you ran,
- a related issue, if one exists.

Pull requests should be small, focused, and safe to merge independently into `main`. Incomplete functionality must be kept disabled, for example behind a feature flag, so the trunk remains deployable.

Version tags are created automatically by semantic-release after changes are merged to `main`. The release workflow uses the repository variable `IMAGE_SEMANTIC_RELEASE` and the secret `SEMANTIC_RELEASE_TOKEN`. The token must be allowed to create releases, push tags, and read the semantic-release image package from GitHub Container Registry.

The image is published to GitHub Container Registry only from version tags matching `v*`.

By contributing, you agree that your changes are licensed under the terms of the repository's `LICENSE` file.

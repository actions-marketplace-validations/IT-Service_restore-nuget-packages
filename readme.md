# GitHub Action "restore-nuget-packages"

[![GitHub release](https://img.shields.io/github/v/release/IT-Service/restore-nuget-packages.svg?sort=semver&logo=github)](https://github.com/IT-Service/restore-nuget-packages/releases)

[![Semantic Versioning](https://img.shields.io/static/v1?label=Semantic%20Versioning&message=v2.0.0&color=green&logo=semver)](https://semver.org/lang/ru/spec/v2.0.0.html)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-v1.0.0-yellow.svg?logo=git)](https://conventionalcommits.org)

This action install specified NuGet executable,
restore packages for specified packages.config file
to specified packages directory.

## Usage

See [action.yml](action.yml)

Basic:

```yaml
steps:
- uses: actions/checkout@v3
- name: Restore NuGet packages for XSLT processing
  uses: IT-Service/restore-nuget-packages@v1
  with:
    packages-config-path: tools/xslt/packages.config
    packages-directory-path: tools/xslt/packages
```

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE).

## Contributions

Contributions are welcome! See [Contributor's Guide](.github/CONTRIBUTING.md).

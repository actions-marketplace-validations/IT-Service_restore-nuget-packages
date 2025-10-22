# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to
[![Semantic Versioning](https://img.shields.io/static/v1?label=Semantic%20Versioning&message=v2.0.0&color=green&logo=semver)](https://semver.org/lang/en/spec/v2.0.0.html).

<!--

### Added

- feature

### Changed

- behavior

### Deprecated

- soon-to-be removed features

### Removed

- now removed features

### Fixed

- bug fixes

### Security

- in case of vulnerabilities
-
-->

## [v1.0.3]

### Fixed

- bump actions/cache to 4.3.0
- bump nuget/setup-nuget from 1.1.1 to 1.2.0
  #36
- bump wagoid/commitlint-github-action from 5.3.1 to 5.4.1
  #35

## [v1.0.1]

### Changed

- Disable NuGet Lock mode
  (`-UseLockFile -LockedMode`)

## [v1.0.0]

### Added

- NuGet executable installation with specified version
- NuGet packages restoring from specified packages.config file
  to specified packages directory
- cache restored NuGet packages

[Unreleased]: https://github.com/IT-Service/restore-nuget-packages/compare/v1.0.0...HEAD
[v1.0.3]: https://github.com/IT-Service/restore-nuget-packages/compare/v1.0.1...v1.0.3
[v1.0.1]: https://github.com/IT-Service/restore-nuget-packages/compare/v1.0.0...v1.0.1
[v1.0.0]: https://github.com/IT-Service/restore-nuget-packages/releases/tag/v1.0.0

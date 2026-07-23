# bcomnes Homebrew Tap

Homebrew formulae for command-line tools maintained by [Bret Comnes](https://github.com/bcomnes).

Formulae in this tap download immutable GitHub tag archives and build locally with Go.

No precompiled release binaries, casks, vendored modules, or published bottles are required.

## Install

Install a formula directly:

```console
brew install bcomnes/tap/goproject
brew install bcomnes/tap/goversion
```

This automatically adds the tap.

Alternatively, add the tap first:

```console
brew tap bcomnes/tap
brew install goproject goversion
```

In a `Brewfile`:

```ruby
tap "bcomnes/tap"
brew "goproject"
brew "goversion"
```

## Available formulae

| Formula | Description | Source |
| --- | --- | --- |
| `goproject` | Create projects from tar-based templates | [`bcomnes/goproject`](https://github.com/bcomnes/goproject) |
| `goversion` | Manage semantic version bumps in Go projects | [`bcomnes/goversion`](https://github.com/bcomnes/goversion) |

## Update

Homebrew updates this tap through its normal update process:

```console
brew update
brew upgrade goproject goversion
```

## How formulae are built

Homebrew downloads a tagged source archive, verifies its SHA-256 checksum, installs Go as a build-only dependency, and runs `go build`.

Go resolves module dependencies through the normal module proxy and verifies them using `go.sum`.

The release version is injected into the binary with Go linker flags.

## Maintaining the tap

For each upstream release:

1. Create and push an immutable semantic-version tag in the source repository.
2. Update the formula's `url` to the new tag archive.
3. Replace the formula's `sha256` with the checksum of that archive.
4. Open a pull request in this repository.
5. Wait for `brew test-bot` to pass on macOS and Linux.
6. Merge the formula update.

A GitHub Release page is optional; the Git tag and tag archive are sufficient.

Example archive checksum command:

```console
curl --fail --location --output release.tar.gz \
  https://github.com/bcomnes/goversion/archive/refs/tags/v2.1.2.tar.gz
shasum -a 256 release.tar.gz
```

Validate a formula locally with:

```console
brew audit --strict --online bcomnes/tap/goproject
brew install --build-from-source bcomnes/tap/goproject
brew test bcomnes/tap/goproject
```

The initial release process is intentionally manual.

Formula-update automation can be added after the manual release and upgrade flow has been validated.

## Documentation

See the [Homebrew documentation](https://docs.brew.sh) for general usage and troubleshooting.

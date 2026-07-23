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

The `update formulae` workflow polls the latest published GitHub Releases for `goproject` and `goversion` every day.
It can also be run manually from the Actions tab with `workflow_dispatch`.

When a newer release exists, the workflow uses `brew bump-formula-pr` to update the formula URL and SHA-256, then opens a pull request.
Each formula uses one deterministic automation branch, so a newer release refreshes the existing open pull request instead of creating stale version-specific pull requests.
The workflow explicitly dispatches `brew test-bot` for the updated branch because pull requests created with `GITHUB_TOKEN` do not trigger normal pull request workflows.

The repository must allow GitHub Actions to create pull requests under **Settings → Actions → General → Workflow permissions**.
No personal access token is required.

To update manually instead, change the formula's release URL and SHA-256, then validate it with:

```console
brew audit --strict --online bcomnes/tap/goproject
brew install --build-from-source bcomnes/tap/goproject
brew test bcomnes/tap/goproject
```

## Documentation

See the [Homebrew documentation](https://docs.brew.sh) for general usage and troubleshooting.

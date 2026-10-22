# Homebrew Tap

这是 [OpenEdifier](https://github.com/xuhuanxxx/open-edifier) 的官方 Homebrew tap。

```bash
brew install xuhuanxxx/tap/open-edifier
```

该 formula 从源码构建 `edifier` CLI。支持边界、使用方法和安全说明以 OpenEdifier 主仓库为准。

## Personal Aliyun CLI and MaxC

```bash
brew install xuhuanxxx/tap/aliyun-cli-personal xuhuanxxx/tap/maxc-personal
```

Both formulae download fixed personal Release archives with SHA256 verification.
MaxC includes its Python runtime. Both are keg-only: existing commands, credentials
and services are not replaced or configured during installation.

```bash
"$(brew --prefix aliyun-cli-personal)/bin/aliyun" version
"$(brew --prefix maxc-personal)/bin/maxc" --version
```

For opt-in bearer authentication, explicitly select the personal Go executable in
`auth.bearer.cli` when preparing your own configuration. Installing packages does
not enable bearer or change authentication. Existing AK/STS modes remain available.

- [Personal Go releases](https://github.com/xuhuanxxx/aliyun-cli/releases)
- [Personal MaxC releases](https://github.com/xuhuanxxx/aliyun-odps-console/releases)

Go declares Apache-2.0. The Python 0.9.4 branch and PyPI artifacts do not identify
a license; this tap makes no new license grant or claim of official support.
Cross-region bearer support remains empirical, not an official service guarantee.
Linux MaxC needs glibc 2.35+. macOS builds are not Developer ID notarized.

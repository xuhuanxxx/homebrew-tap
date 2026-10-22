# Homebrew Tap

这是 [OpenEdifier](https://github.com/xuhuanxxx/open-edifier) 的官方 Homebrew tap。

```bash
brew install xuhuanxxx/tap/open-edifier
```

该 formula 从源码构建 `edifier` CLI。支持边界、使用方法和安全说明以 OpenEdifier 主仓库为准。

## AliyunX and MaxCX

```bash
brew install xuhuanxxx/tap/aliyunx xuhuanxxx/tap/maxcx
aliyunx version
maxcx --version
brew upgrade aliyunx maxcx
```

The fork commands are `aliyunx` and `maxcx`, directly available on PATH. Neither
installs an `aliyun` or `maxc` alias. Existing official commands and authentication
configuration are not changed. MaxCX bundles Python; no project virtualenv is needed.
Version output includes the X release and source revision. Release downloads are
pinned by SHA256. `aliyunx upgrade` directs users to Homebrew instead of replacing
itself with an official binary.

Bearer remains opt-in. MaxCX defaults its bearer credential process to `aliyunx`;
an explicit `auth.bearer.cli` path overrides that default. Configuration and job
formats remain compatible. Invoke `maxcx` directly: the Go CLI's official `maxc`
plugin is not redirected to this fork.

After verifying the new commands, old packages can be removed with
`brew uninstall aliyun-cli-personal maxc-personal`. Check any explicit executable
paths in your own scripts first; this tap does not silently rewrite them.

- [AliyunX releases](https://github.com/xuhuanxxx/aliyun-cli/releases)
- [MaxCX releases](https://github.com/xuhuanxxx/aliyun-odps-console/releases)

Go declares Apache-2.0. The Python 0.9.4 branch and PyPI artifacts do not identify
a license; this tap makes no new license grant or claim of official support.
Cross-region bearer support remains empirical, not an official service guarantee.
Linux MaxCX needs glibc 2.35+. macOS builds are not Developer ID notarized.

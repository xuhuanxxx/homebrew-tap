# Homebrew Tap

这是 [OpenEdifier](https://github.com/xuhuanxxx/open-edifier) 的官方 Homebrew tap。

```bash
brew install xuhuanxxx/tap/open-edifier
```

该 formula 从源码构建 `edifier` CLI。支持边界、使用方法和安全说明以 OpenEdifier 主仓库为准。

## Personal Alibaba Cloud CLI (preparation branch)

`Formula/aliyun-cli-personal.rb` pins the personal CLI source commit and the
upstream API metadata commit with verified SHA256 checksums. It is a source-build
formula pending a versioned binary release; it does not use expiring Actions
artifact URLs. The official Go tree declares Apache-2.0.

The formula is keg-only and has no post-install login, service, upgrade or config
commands. After an explicit future installation, select the binary by its full
`$(brew --prefix aliyun-cli-personal)/bin/aliyun` path. It must not replace the
existing `aliyun` on PATH automatically. No local installation was performed.

The branch contains the OAuth fixes and credential-process interface, not the
experimental native mc command or the maxc wrapper redesign. Installing this Go
formula does not install the patched Python MaxC or change the official plugin
source. See the source repository's personal-packages documentation for limits.

### Python MaxC licensing gate (checked 2026-10-22)

The Java `release/0.56.x` branch of aliyun/aliyun-odps-console declares Apache-2.0
in README.md and pom.xml. The Python `codex/maxc-094-public-20261021` branch has no
LICENSE/NOTICE/COPYING files or license declaration in setup.py. PyPI 0.9.4 JSON,
wheel METADATA and sdist PKG-INFO also contain no license declaration, and neither
archive contains a license file. The Java branch statement alone does not settle
the licensing scope of this Python source. Do not label it Apache-2.0 by inference.

No Python formula is enabled until the maintainer identifies the applicable
license and redistribution terms. Once confirmed, install the entire PyInstaller
onedir under libexec (not just its executable), preserve dependency notices, and
pin release URLs/checksums. Configure the Go credential executable explicitly in
a separate opt-in setup; do not write credentials from a formula. The bearer RFC
service-support boundaries remain independent of the licensing question.

Evidence:
- https://github.com/aliyun/aliyun-odps-console/tree/codex/maxc-094-public-20261021
- https://github.com/aliyun/aliyun-odps-console/blob/release/0.56.x/README.md
- https://github.com/aliyun/aliyun-odps-console/blob/release/0.56.x/pom.xml
- https://pypi.org/pypi/maxc-cli/0.9.4/json

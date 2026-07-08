# OpenCode

Open-source agent that helps you write code in your terminal

**Package:** opencode  
**Author:** DevCoreX  
**Repository:** https://github.com/W8SOJIB/W8Core-Termux-Moded  
**Official:** https://github.com/anomalyco/opencode  
**Type:** AI coding agent (Binary + glibc bootstrapper)  
**License:** MIT

## Description

OpenCode is an AI-powered coding agent developed by anomalyco that operates directly in your terminal. It provides intelligent code completion, refactoring suggestions, and natural language code generation. W8Core-Termux-Moded installs OpenCode natively with glibc support for best performance.

## Dependencies

- **Native mode:** glibc-repo, glibc, clang, git, ripgrep, python, jq, nodejs-lts, curl, tar
- **Proot mode:** proot-distro, curl, ca-certificates

## Install

```bash
core install ai --opencode
```

You will be prompted to choose:

**Native (recommended)** — Compiles a glibc bootstrapper and downloads the latest OpenCode binary from GitHub releases

## Uninstall

```bash
core uninstall ai --opencode
```

## Update

```bash
core update ai --opencode
```

## Notes

- **Native mode** requires `glibc-repo`, `glibc`, `clang`, and other dependencies (installed automatically)
- The native binary is stored in `~/.local/share/core-termux-data/opencode/`
- A small C bootstrapper (`opencode_helper.c`) handles ELF loading via the glibc dynamic linker
- Data directory: `~/.local/share/core-termux-data/opencode/`

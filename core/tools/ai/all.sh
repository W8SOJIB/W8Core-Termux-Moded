#!/bin/bash

import "@/utils/log"

LOG_FILE="$CORE_CACHE/install_ai.log"

AI_TOOLS=(
  "claude-code"
  "opencode"
  "kilocode-cli"
)

source "$(dirname "$BASH_SOURCE")/claude-code/install.sh"
source "$(dirname "$BASH_SOURCE")/opencode/install.sh"
source "$(dirname "$BASH_SOURCE")/kilocode-cli/install.sh"

_install_ai_tool() {
  case "$1" in
  claude-code) loading "Installing Claude Code" install_claude_code ;;
  opencode) loading "Installing OpenCode" install_opencode ;;
  kilocode-cli) loading "Installing Kilo Code CLI" install_kilocode_cli ;;
  *) log_warn "Unknown AI tool: --$1"; return 2 ;;
  esac
}

_uninstall_ai_tool() {
  case "$1" in
  claude-code) loading "Uninstalling Claude Code" uninstall_claude_code ;;
  opencode) loading "Uninstalling OpenCode" uninstall_opencode ;;
  kilocode-cli) loading "Uninstalling Kilo Code CLI" uninstall_kilocode_cli ;;
  *) log_warn "Unknown AI tool: --$1"; return 2 ;;
  esac
}

_update_ai_tool() {
  case "$1" in
  claude-code) loading "Updating Claude Code" update_claude_code ;;
  opencode) loading "Updating OpenCode" update_opencode ;;
  kilocode-cli) loading "Updating Kilo Code CLI" update_kilocode_cli ;;
  *) log_warn "Unknown AI tool: --$1"; return 2 ;;
  esac
}

_reinstall_ai_tool() {
  case "$1" in
  claude-code) loading "Reinstalling Claude Code" reinstall_claude_code ;;
  opencode) loading "Reinstalling OpenCode" reinstall_opencode ;;
  kilocode-cli) loading "Reinstalling Kilo Code CLI" reinstall_kilocode_cli ;;
  *) log_warn "Unknown AI tool: --$1"; return 2 ;;
  esac
}

_run_all_ai_tools() {
  local action="$1"
  local success_count=0
  local failed_count=0
  local tool

  for tool in "${AI_TOOLS[@]}"; do
    "_${action}_ai_tool" "$tool"
    case $? in
    0) ((success_count++)) ;;
    1) ((failed_count++)) ;;
    esac
  done

  return 0
}

install_all_ai_tools() {
  _run_all_ai_tools install
}

uninstall_all_ai_tools() {
  _run_all_ai_tools uninstall
}

update_all_ai_tools() {
  _run_all_ai_tools update
}

reinstall_all_ai_tools() {
  _run_all_ai_tools reinstall
}
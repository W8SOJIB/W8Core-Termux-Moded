#!/data/data/com.termux/files/usr/bin/bash

import "@/utils/log"
import "@/utils/colors"

LOG_FILE="$CORE_CACHE/install_ai.log"

install_ai() {
  separator
  box "Installing AI Tools"
  separator
  echo

  log_info "Installing AI tools..."
  echo
  log_info "☕ Grab a coffee! This process typically takes 1h-2h hours."
  log_info "   Don't worry, it's normal for this to take a while..."
  echo

  mkdir -p "$(dirname "$LOG_FILE")"

  _install_ai_tools_wrapper
  log_success "AI tools installed successfully"
  separator
  echo
  list_item "Claude Code ${GRAY}(${D_GREEN}claude${GRAY})"
  list_item "OpenCode ${GRAY}(${D_GREEN}opencode${GRAY})"
  list_item "Kilo Code CLI ${GRAY}(${D_GREEN}kilo${GRAY})"
  echo
}

_install_ai_tools_wrapper() {
  import "@/tools/ai/all"
  install_all_ai_tools
}

uninstall_ai() {
  if ! command -v opencode &>/dev/null && ! command -v claude &>/dev/null && ! command -v kilo &>/dev/null; then
    log_info "AI Tools are not installed"
    return 0
  fi
  separator
  box "Uninstalling AI Tools"
  separator
  echo

  log_info "Uninstalling AI tools..."

  _uninstall_ai_tools_wrapper
  log_success "AI tools uninstalled"
}

_uninstall_ai_tools_wrapper() {
  import "@/tools/ai/all"
  uninstall_all_ai_tools
}

update_ai() {
  separator
  box "Updating AI Tools"
  separator
  echo

  log_info "Updating AI tools..."

  _update_ai_tools_wrapper
  log_success "AI tools updated"
}

_update_ai_tools_wrapper() {
  import "@/tools/ai/all"
  update_all_ai_tools
}

reinstall_ai() {
  separator
  box "Reinstalling AI Tools"
  separator
  echo

  log_info "Reinstalling AI tools..."
  echo

  _reinstall_ai_tools_wrapper
  log_success "AI tools reinstalled successfully"
  separator
  echo
  list_item "Claude Code"
  list_item "OpenCode"
  list_item "Kilo Code CLI"
  echo
}

_reinstall_ai_tools_wrapper() {
  import "@/tools/ai/all"
  reinstall_all_ai_tools
}

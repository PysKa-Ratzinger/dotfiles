#!/bin/bash

SCRIPTPATH="$(
	cd -- "$(dirname "$0")" >/dev/null 2>&1
	pwd -P
)"

TS="$(date +%s)"

C_RST="\033[0m"
C_RED="\033[0;31m"
C_GREEN="\033[1;32m"
C_YELLOW="\033[1;33m"
C_CYAN="\033[01;96m"
C_PURPLE="\033[01;35m"
C_BLUE="\033[01;34m"
C_LGRAY="\033[00;37m"

USE_COLOR=true

log_info() {
	if [ "${USE_COLOR}" = true ]; then
		echo -e "[${C_GREEN}+${C_RST}]" "$@"
	else
		echo -e "[+]" "$@"
	fi
}

log_error() {
	if [ "${USE_COLOR}" = true ]; then
		echo -e "[${C_RED}-${C_RST}]" "$@"
	else
		echo -e "[-]" "$@"
	fi
}

fail() {
	log_error "An error ocurred. Aborting..."
	exit 1
}

# ----------------------------------------------

install_dot() {
	SOURCE="$SCRIPTPATH/$1"
	TARGET="$HOME/$1"

	if [ ! -e "$TARGET" ]; then
		log_info "$TARGET not found."
	elif [ "$(readlink -f "$TARGET")" == "$SOURCE" ]; then
		log_info "[  NOOP  ] $TARGET."
		return 0
	else
		BACKUP_FILE="${TARGET}.${TS}"
		log_info "[ BACKUP ] ${BACKUP_FILE}."
		if [ -e "${BACKUP_FILE}" ]; then
			fail "[   NOK  ] ${BACKUP_FILE} found. Aborting..."
		fi

		mv "${TARGET}" "${BACKUP_FILE}"
	fi

	log_info "[ INSTALL] $TARGET"
	ln -s "$SOURCE" "$TARGET"
}

# ----------------------------------------------

log_info ""
log_info "--- PysKa's dotfiles ---"
log_info ""
log_info "Installing light version..."
log_info "Timestamp: $TS"

install_dot ".lscolors.sh"
install_dot ".inputrc"
install_dot ".profile"
install_dot ".vimrc"
install_dot ".bashrc"
install_dot ".bash_aliases"
install_dot ".tmux.conf"
install_dot ".config/tmux"
install_dot ".config/lazygit"
install_dot ".config/nvim"

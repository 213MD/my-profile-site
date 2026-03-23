# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Functions
__conda_activate () {
	if [ -n "${CONDA_PS1_BACKUP:+x}" ]
	then
		PS1="$CONDA_PS1_BACKUP" 
		\unset CONDA_PS1_BACKUP
	fi
	\local ask_conda
	ask_conda="$(PS1="${PS1:-}" __conda_exe shell.posix "$@")"  || \return
	\eval "$ask_conda"
	__conda_hashr
}
__conda_exe () {
	(
		"$CONDA_EXE" $_CE_M $_CE_CONDA "$@"
	)
}
__conda_hashr () {
	if [ -n "${ZSH_VERSION:+x}" ]
	then
		\rehash
	elif [ -n "${POSH_VERSION:+x}" ]
	then
		:
	else
		\hash -r
	fi
}
__conda_reactivate () {
	\local ask_conda
	ask_conda="$(PS1="${PS1:-}" __conda_exe shell.posix reactivate)"  || \return
	\eval "$ask_conda"
	__conda_hashr
}
conda () {
	\local cmd="${1-__missing__}"
	case "$cmd" in
		(activate | deactivate) __conda_activate "$@" ;;
		(install | update | upgrade | remove | uninstall) __conda_exe "$@" || \return
			__conda_reactivate ;;
		(*) __conda_exe "$@" ;;
	esac
}
# Shell Options
setopt nohashdirs
setopt login
# Aliases
alias -- ll='ls -l'
alias -- run-help=man
alias -- which-command=whence
# Check for rg availability
if ! (unalias rg 2>/dev/null; command -v rg) >/dev/null 2>&1; then
  function rg {
  if [[ -n $ZSH_VERSION ]]; then
    ARGV0=rg /Users/marklin/.local/share/claude/versions/2.1.81 "$@"
  elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "win32" ]]; then
    ARGV0=rg /Users/marklin/.local/share/claude/versions/2.1.81 "$@"
  elif [[ $BASHPID != $$ ]]; then
    exec -a rg /Users/marklin/.local/share/claude/versions/2.1.81 "$@"
  else
    (exec -a rg /Users/marklin/.local/share/claude/versions/2.1.81 "$@")
  fi
}
fi
export PATH=/Users/marklin/.antigravity/antigravity/bin\:/Users/marklin/.local/bin\:/Users/marklin/.antigravity/antigravity/bin\:/opt/homebrew/bin\:/opt/homebrew/sbin\:/Library/Frameworks/Python.framework/Versions/3.11/bin\:/usr/local/bin\:/System/Cryptexes/App/usr/bin\:/usr/bin\:/bin\:/usr/sbin\:/sbin\:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin\:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin\:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin\:/opt/pmk/env/global/bin\:/Users/marklin/.antigravity/antigravity/bin\:/Users/marklin/.local/bin\:/Users/marklin/anaconda3/bin\:/Users/marklin/anaconda3/condabin

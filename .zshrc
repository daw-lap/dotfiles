if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/space.omp.json)"
fi

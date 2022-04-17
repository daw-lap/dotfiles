if status is-interactive
    # Commands to run in interactive sessions can go here
end

# oh-my-posh init fish --config $HOME/.poshthemes/robbyrussel.omp.json | source
# oh-my-posh init fish --config $HOME/.poshthemes/pararussel.omp.json | source
# oh-my-posh init fish --config $HOME/.poshthemes/amro.omp.json | source
oh-my-posh init fish --config $HOME/.poshthemes/patriksvensson.omp.json | source

fish_add_path $HOME/dev-helper-functions

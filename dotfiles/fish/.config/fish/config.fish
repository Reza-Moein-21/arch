if status is-interactive
# Commands to run in interactive sessions can go here
end

starship init fish | source

export VPN_USER=pre1m2019605
export VPN_PASS=32925

alias grep 'grep --color=auto'
alias ls 'eza --icons'
alias ll 'eza -lh --git'
alias la 'eza -lah --git'
alias tree 'eza --tree'

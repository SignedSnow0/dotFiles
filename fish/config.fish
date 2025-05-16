if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

export EDITOR=/usr/bin/nvim

starship init fish | source

fish_add_path /home/signedsnow0/.spicetify

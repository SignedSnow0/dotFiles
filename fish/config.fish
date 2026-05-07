if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

export EDITOR=/usr/bin/nvim
export LLVM_SYS_181_PREFIX=/lib/llvm18/
export ANDROID_HOME=/opt/android-sdk

starship init fish | source

fish_add_path /home/signedsnow0/.spicetify
fish_add_path /home/signedsnow0/.flutter/flutter/bin
fish_add_path $ANDROID_HOME/tools
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin

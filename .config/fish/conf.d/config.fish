# fish config 
 
# alias for ls (Alternative colorls)
function ls 
	colorls -al --sd $argv
end

# Editor
set -gx EDITOR "vim"
set TERM "xterm-256color"  

# "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" 

# Ruby to path (For colorls)
fish_add_path /home/rlocone/.local/share/gem/ruby/2.7.0/bin

# Remove Greetiing (Sorry, it's annoying)
set -U fish_greeting

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# bat
alias cat='bat'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Dracula Theme
set -l foreground f8f8f2
set -l selection 44475a
set -l comment 6272a4
set -l red ff5555
set -l orange ffb86c
set -l yellow f1fa8c
set -l green 50fa7b
set -l purple bd93f9
set -l cyan 8be9fd
set -l pink ff79c6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_match --background=$selection
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

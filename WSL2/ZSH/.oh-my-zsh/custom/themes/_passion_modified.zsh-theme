# login_info
function login_info() {
    local color="%{$fg_bold[blue]%}";
    local hostname="$(hostname)";
    local color_reset="%{$reset_color%}";
    echo "${color}[%n@${hostname}${color_reset}";
}

# directory
function directory() {
    local color="%{$fg_bold[blue]%}";
    local directory="${PWD/#$HOME/~}";
    local color_reset="%{$reset_color%}";
    echo "${color}${directory}]${color_reset}";
}


# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git(%{$fg_bold[red]%}";
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} ";
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[blue]%}) 🔥";
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})";

function update_git_status() {
    GIT_STATUS=$(git_prompt_info);
}

function git_status() {
    echo "${GIT_STATUS}"
}


# command
function update_command_status() {
    local arrow="";
    local color_reset="%{$reset_color%}";
    local reset_font="%{$fg_no_bold[white]%}";
    COMMAND_RESULT=$1;
    export COMMAND_RESULT=$COMMAND_RESULT
    if $COMMAND_RESULT;
    then
        arrow="%{$fg_bold[red]%}>%{$fg_bold[yellow]%}>%{$fg_bold[green]%}>";
    else
        arrow="%{$fg_bold[red]%}>>>";
    fi
    COMMAND_STATUS="${arrow}${reset_font}${color_reset}";
}
update_command_status true;

function command_status() {
    echo "${COMMAND_STATUS}"
}

# command execute after
precmd() {
    # last_cmd
    local last_cmd_return_code=$?;
    local last_cmd_result=true;
    if [ "$last_cmd_return_code" = "0" ];
    then
        last_cmd_result=true;
    else
        last_cmd_result=false;
    fi

    # update_git_status
    update_git_status;

    # update_command_status
    update_command_status $last_cmd_result;
}

# timer
TMOUT=1;
TRAPALRM() {
    if [ "$WIDGET" = "" ] || [ "$WIDGET" = "accept-line" ] ; then
        zle reset-prompt;
    fi
}

# set option
setopt PROMPT_SUBST;

# prompt
PROMPT='$(login_info):$(directory) $(git_status)$(command_status) ';
RPROMPT='%{$fg_bold[white]%}[%*]%f %{$fg_no_bold[white]%}';
if status is-interactive
    # Disable greeting
    set -gx fish_greeting

    # With the scales prompt, expand all parent directories to their full name
    set -g fish_prompt_pwd_dir_length 0
end

if status is-interactive
    if command -q bat
        set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    end
end

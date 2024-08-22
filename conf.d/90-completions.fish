if status is-interactive
    function complete_command
        # Source the generated fish completions when the command exists
        if command -q $argv[1]
            $argv | source
        end
    end

    complete_command fd --gen-completions=fish
    complete_command jj util completion fish
    complete_command rg --generate complete-fish
    complete_command ruff generate-shell-completion fish
    complete_command rye self completion --shell fish
    complete_command uv generate-shell-completion fish
end

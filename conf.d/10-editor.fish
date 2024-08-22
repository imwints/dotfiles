if status is-interactive
    # Set helix as the default editor
    if command -q hx
        set -gx EDITOR hx
    else if command -q helix
        # On arch linux, the helix binary is `helix`
        set -gx EDITOR helix
    end
end

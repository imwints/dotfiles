if command -q kitty
    function ssh --description 'alias ssh kitty +kitten ssh'
        kitty +kitten ssh $argv

    end
end

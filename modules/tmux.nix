{
    programs.tmux = {
        enable = true;
        clock24 = true;
        extraConfig = ''
            set -g default-terminal "screen-256color"

            bind h select-pane -L
            bind j select-pane -D
            bind k select-pane -U
            bind l select-pane -R


            bind -r H resize-pane -L  10
            bind -r J resize-pane -D  10
            bind -r K resize-pane -U  10
            bind -r L resize-pane -R  10

            set -g history-limit 20000

            setw -g mouse on
        '';
    };
}

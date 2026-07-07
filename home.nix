{ pkgs, ... }:
{
  home.username = "franklouw";
  home.homeDirectory = "/home/franklouw";
  home.stateVersion = "26.05";

  # Required for non-NixOS systems - fixes PATH, XDG_DATA_DIRS, etc.
  targets.genericLinux.enable = true;

  programs.helix = {
    enable = true;
    settings = {
      theme = "default";
      editor.line-number = "relative";
    };
  };

  home.packages = [
    pkgs.claude-code
    pkgs.azure-cli
    pkgs.kubectl
  ];

  programs.git = {
      enable = true;
      attributes = [ "* text=auto eol=lf" ];
      settings = {
        user = {
          name = "Frank Louw";
          email = "frank.louw@redpathmining.com";
        };
        init.defaultBranch = "main";
        alias.st = "status";
        core = {
          autocrlf = false;
          eol = "lf";
        };
      };
    };  

  programs.java = {
    enable = true;
    package = pkgs.temurin-bin-25;
  };

  programs.ripgrep.enable = true;

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
    };
  };


  programs.tmux = {
    enable = true;
    prefix = "C-a";
    mouse = true;
    historyLimit = 10000;
    keyMode = "vi";
    baseIndex = 1;
    escapeTime = 10;
    terminal = "tmux-256color";
    extraConfig = ''
      set -as terminal-features ",*:RGB"

      # Split panes with | and -
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # Move between panes with vim keys
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded"

      # Status bar
      set -g status-position top
    '';
  };
  
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
  };
}

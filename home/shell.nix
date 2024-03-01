{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      zsh
      coreutils
      ripgrep
      tree
      tig
      fira-code-nerdfont
    ];

    file = {
      ".aliases".source = ../dotfiles/.aliases;
      ".prompt".source = ../dotfiles/.prompt;
    };
  };

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;

      # bashrcExtra = ''
      #   if [[ -z BASH_COMPLETION_VERSINFO ]]; then
      #     . "${pkgs.bash-completion}/share/bash-completion/bash_completion"
      #   fi
      # '';

        # source "${pkgs.git}/share/git/contrib/completion/git-prompt.sh"
        # export PS1='%~ $(__git_ps1 "(%s) ")%# '

        # source ~/.nix-profile/share/git/contrib/completion/git-prompt.sh
        # setopt PROMPT_SUBST
        # if [ -r "$HOME/.prompt" ]; then source "$HOME/.prompt"; fi

      initExtra = ''
        source "${pkgs.git}/share/git/contrib/completion/git-prompt.sh"
        export PS1='%~ $(__git_ps1 "(%s) ")%# '

        if [ -r "$HOME/.aliases" ]; then source "$HOME/.aliases"; fi
      '';
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = true;
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        nix_shell = {
          disabled = false;
          impure_msg = "[impure shell](bold red)";
          pure_msg = "[pure shell](bold green)";
          unknown_msg = "[unknown shell](bold yellow)";
          format = "via [☃️ $state( \($name\))](bold blue) ";
        };
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };

    htop = {
      enable = true;
      settings = {
        highlight_base_name = 1;
      };
    };
  };
}
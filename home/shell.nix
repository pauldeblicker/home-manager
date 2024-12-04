{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      zsh
      coreutils
      ripgrep
      tree
      tig
      nix-prefetch-github
      fira-code-nerdfont
      zoxide
      fzf
      git-absorb
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

    vim = {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins;
        [
          vim-gitgutter
          gruvbox-community
          nerdcommenter
          vim-airline
          indentLine
          vim-nix
        ];
      settings = {
        hidden = true;
        background = "dark";
        number = true;
      };
      extraConfig = ''
        let mapleader=","

        set backspace=indent,eol,start
        set encoding=utf-8
        set hlsearch
        set nocompatible
        set splitbelow
        set splitright
        set termguicolors

        syntax on
        filetype on
        filetype plugin indent on

        let g:gruvbox_italic=1
        colorscheme gruvbox

        noremap <leader>l <C-w>l
        noremap <leader>h <C-w>h
        noremap <leader>j <C-w>j
        noremap <leader>k <C-w>k
      '';
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
      };
      completionInit = "autoload -U compinit && compinit -u";
      antidote = {
        enable = true;
        plugins = [
          "zsh-users/zsh-autosuggestions"
          "zsh-users/zsh-syntax-highlighting"
        ];
      };

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

        eval "$(zoxide init zsh)"
      '';

    #   plugins = [
    #     {
    #       name = "zsh-autosuggestions";
    #       src = pkgs.fetchFromGitHub {
    #         owner = "zsh-users";
    #         repo = "zsh-autosuggestions";
    #         rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
    #         hash = "sha256-B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
    #       };
    #     }
    #     {
    #       name = "enhancd";
    #       file = "init.sh";
    #       src = pkgs.fetchFromGitHub {
    #         owner = "b4b4r07";
    #         repo = "enhancd";
    #         rev = "230695f8da8463b18121f58d748851a67be19a00";
    #         hash = "sha256-XJl0XVtfi/NTysRMWant84uh8+zShTRwd7t2cxUk+qU=";
    #       };
    #     }
    #     {
    #       name = "zsh-syntax-highligthing";
    #       src = pkgs.fetchFromGitHub {
    #         owner = "zsh-users";
    #         repo = "zsh-syntax-highlighting";
    #         rev = "e0165eaa730dd0fa321a6a6de74f092fe87630b0";
    #         hash = "sha256-4rW2N+ankAH4sA6Sa5mr9IKsdAg7WTgrmyqJ2V1vygQ=";
    #       };
    #     }
    #   ];
    };
  };
}

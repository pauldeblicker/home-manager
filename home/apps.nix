{ pkgs, ... }:

{
  home.packages = with pkgs; [    
    iterm2
    slack
    spotify
    raycast
    bruno
  ];
  
  nixpkgs.config.allowUnfree = true;

  programs = {
    firefox = {
      enable = false;
      package = pkgs.Firefox;

      profiles.pauldeblicker = {
        search = {
          force = true;
          default = "Google";
          engines = {
            "DuckDuckGo".metaData.hidden = true;
            "Wikipedia (fr)".metaData.alias = "@wiki";
          };
        };
        settings = {
          "general.smoothScroll" = true;
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
          bitwarden
          clearurls
          ghostery
          privacy-badger
        ];
      };
    };

    vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        jdinhlife.gruvbox
        bbenoist.nix
      ];
    };

    zed-editor = {
      enable = true;
    };

    kitty = {
      enable = true;
      settings = {
        font_family = "FiraCode Nerd Font Mono";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";

        selection_foreground = "#ebdbb2";
        selection_background = "#d65d0e";
        background = "#282828";
        foreground = "#ebdbb2";
        color0 = "#3c3836";
        color1 = "#cc241d";
        color2 = "#98971a";
        color3 = "#d79921";
        color4 = "#458588";
        color5 = "#b16286";
        color6 = "#689d6a";
        color7 = "#a89984";
        color8 = "#928374";
        color9 = "#fb4934";
        color10 = "#b8bb26";
        color11 = "#fabd2f";
        color12 = "#83a598";
        color13 = "#d3869b";
        color14 = "#8ec07c";
        color15 = "#fbf1c7";
        cursor = "#bdae93";
        cursor_text_color = "#665c54";
        url_color = "#458588";
      };
    };
  };
}


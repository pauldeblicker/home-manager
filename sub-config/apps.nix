{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = [
      pkgs.vscode-extensions.vscodevim.vim
      pkgs.vscode-extensions.jdinhlife.gruvbox
    ];
  };
}


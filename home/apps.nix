{ pkgs, ... }:

{
  home.packages = with pkgs; [    
    iterm2
    slack
    spotify
    raycast
  ];
  
  nixpkgs.config.allowUnfree = true;

  programs = {
    firefox = {
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

    vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        jdinhlife.gruvbox
        bbenoist.nix
      ];
    };
  };
}


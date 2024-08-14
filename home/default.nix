{ pkgs, ... }:
{
  home.username = "pauldeblicker";
  home.homeDirectory = "/Users/pauldeblicker";

  home.stateVersion = "23.11";

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/paul.deblicker/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

  imports = [
    ./apps.nix
    ./git.nix
    ./shell.nix
  ];
}

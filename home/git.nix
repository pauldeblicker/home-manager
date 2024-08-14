{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Paul Deblicker";
    userEmail = "paul.deblicker@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

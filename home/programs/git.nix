{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;

    userName = "Rasmus Villebro";
    userEmail = "rasmus-villebro@hotmail.com";
  };
}
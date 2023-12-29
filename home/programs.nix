{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    pigz

    # utils
    ripgrep
    fd

    # misc
    # xdg-utils

    # productivity
    # obsidian

    # python
    python310
    python311
    python312
  ];

  programs = {
    firefox = {
      enable = true;
      profiles.rav = {};
    };
    tmux = {
      enable = true;
      clock24 = true;
    };
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };
    git = {
      enable = true;
      userName = "Rasmus Villebro";
      userEmail = "rasmus-villebro@hotmail.com";
    };
    btop.enable = true;  # replacement of htop/nmon
    exa.enable = true;   # A modern replacement for ‘ls’
    ssh.enable = true;
    aria2.enable = true;
  };
}
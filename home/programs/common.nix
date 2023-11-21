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
    xdg-utils

    # productivity
    obsidian

    # python
    python310
    python311
    python312
  ];

  programs = {
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

    btop.enable = true;  # replacement of htop/nmon
    exa.enable = true;   # A modern replacement for ‘ls’
    ssh.enable = true;
    aria2.enable = true;
  };
}
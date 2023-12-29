{ pkgs, config, ... }: 

{
  home = {
    packages = with pkgs; [
      # nix tooling
      alejandra
      deadnix
      statix
    ];

    sessionVariables = {
      # clean up ~
      STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";
      LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
      LESSKEY = "${config.xdg.configHome}/less/lesskey";

      # set default applications
      EDITOR = "vim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
  };

  programs = {
    bash.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableBashIntegration = true;
    };

    starship = {
      enable = true;
      settings = {
        character = {
          success_symbol = "[›](bold green)";
          error_symbol = "[›](bold red)";
        };
      };
    };

    alacritty = {
      enable = true;
      settings = {
        window.opacity = 0.95;
        window.dynamic_padding = true;
        scrolling.history = 10000;
      };
    };
  };
}
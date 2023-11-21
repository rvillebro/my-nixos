{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  

#   fonts = {
#     fonts = with pkgs; [
#       # icon fonts
#       material-design-icons

#       # normal fonts
#       noto-fonts
#       noto-fonts-cjk
#       noto-fonts-emoji

#       # nerdfonts
#       (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
#     ];

#     # use fonts specified by user rather than default ones
#     enableDefaultFonts = false;

#     # user defined fonts
#     # the reason there's Noto Color Emoji everywhere is to override DejaVu's
#     # B&W emojis that would sometimes show instead of some Color emojis
#     fontconfig.defaultFonts = {
#       serif = [ "Noto Serif" "Noto Color Emoji" ];
#       sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
#       monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
#       emoji = [ "Noto Color Emoji" ];
#     };
#   };

  programs.dconf.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    sysstat
    neofetch
  ];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.power-profiles-daemon = {
    enable = true;
  };

  services = {
    dbus.packages = [ pkgs.gcr ];

    geoclue2.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rav = {
    isNormalUser = true;
    description = "rav";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
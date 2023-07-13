# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.wireless.userControlled.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.prabal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
    packages = with pkgs; [
      firefox
      tree
      neovim
      blueman
      bluez
      kitty
      fish
      ranger
      packer
      pkgs.input-remapper
      pkgs.mate.caja
      pkgs.fish
      pkgs.gh
      pkgs.teams
      pkgs.feh
      pkgs.htop-vim
    ];
  };

  programs.fish.enable = true;
  programs.dconf.enable = true;
  services.input-remapper.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    lxappearance
    clipmenu
    git
    pkgs.ripgrep
    pkgs.gcc
    pkgs.nodejs_20
    pkgs.nodePackages_latest.pnpm
    pkgs.copyq
    pkgs.pulseaudio
    pkgs.tmux
    pkgs.pavucontrol
    pkgs.brave
    pkgs.spotify
    pkgs.stow
    pkgs.picom
    pkgs.google-cloud-sdk
    pkgs.fzf
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  environment.pathsToLink = ["/libexec"];
  services.xserver = {
  enable = true;
  desktopManager = {
    xterm.enable = false;
  };
  displayManager = {
    defaultSession = "none+i3";
  };
  windowManager.i3 =  {
    enable = true;
    extraPackages = with pkgs; [
 	dmenu
	i3status
	i3lock-color
	i3blocks
   ];
  };
 };
 nix.settings.experimental-features = ["nix-command" "flakes"];
 fonts.fonts = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
];
nixpkgs.config.allowUnfree = true;

  # xmodmap key mappings
  # services.xserver.displayManager.sessionCommands = ${pkgs.xorg.xmodmap}/bin/xmodmap "${pkgs.writeText "xkb-layout" ''
  # ! Map umlauts tot alt + <key>
  #   keycode 108 = Mode_switch
  # ''}"
}


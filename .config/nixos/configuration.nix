# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

let
  my-python-packages = ps: with ps; [
    cairocffi
    cffi
    xcffib
    dbus-next
    requests
    pip
    ipython
    black
    qtile-extras
    pygame
    pandas
    xmlsec
  ];
in

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
  services.xserver.xkbOptions = "eurosign:e,caps:shift,alt_r:control_r,end:shift_r";
  
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.spotifyd.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport = true;

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
      input-remapper
      fish
      gh
      teams
      feh
      htop-vim
      discord
      teamviewer
      poetry
      monitor
      fd
      ruff
      mypy
      sxhkd
      rofi
      wofi
      krusader
      waybar
      eww-wayland
      ngrok
      nodePackages_latest.serve
      xsel
      sonic-pi
      virtualbox
      qemu
      xorg.xbacklight
    ];
  };

  programs.fish.enable = true;
  programs.dconf.enable = true;
  services.input-remapper.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  (python3.withPackages my-python-packages)
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    lxappearance
    clipmenu
    git
    ripgrep
    gcc
    nodejs_20
    nodePackages_latest.pnpm
    copyq
    pulseaudio
    tmux
    pavucontrol
    brave
    spotify
    stow
    picom
    google-cloud-sdk
    fzf
    code-minimap
    python311
    obs-studio
    rustup
    xclip
    neofetch
    python310Packages.qtile
    spotify-tui
    spotifyd
    polybar
    brightnessctl
    zsh
    oh-my-zsh
    lazygit
    remmina
    stylua
    deno
    electron
    gitui
    libstdcxx5
    vlc
    vscode
    libreoffice
    nim
    nimlsp
    gimp
    libsForQt5.spectacle
    libxml2
    azure-cli
    inetutils
    nmap
    dunst
  ];

  # Some programs need SUID wrappers, can be configured further or are
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "startplasma-x11";

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
  # displayManager = {
  #   defaultSession = "none+i3";
  # };
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
   # (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
   nerdfonts
  ];
  nixpkgs.config.allowUnfree = true;
  services.picom.enable = true;
  programs.hyprland = {
      enable = true;
      xwayland = {
          enable = true;
          hidpi = false;
   };
  };
  services.xserver.windowManager.qtile.enable = true;

  # xmodmap key mappings
  # services.xserver.displayManager.sessionCommands = ${pkgs.xorg.xmodmap}/bin/xmodmap "${pkgs.writeText "xkb-layout" ''
  # ! Map umlauts tot alt + <key>
  #   keycode 108 = Mode_switch
  # ''}"
}


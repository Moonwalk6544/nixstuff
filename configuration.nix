# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs,... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix 
      #./network.nix
      #inputs.rednix.container
      #./bluetooth.nix  
      #./cloud.nix  
      #./code.nix  
      #./container.nix  
      #./dns.nix  
      #./exploits.nix  
      #./forensics.nix  
      #./fuzzers.nix  
      #./generic.nix  
      #./hardware.nix  
      #./host.nix  
      #./information-gathering.nix  
      #./kubernetes.nix  
      #./ldap.nix  
      #./load-testing.nix  
      #./malware.nix  
      #./misc.nix  
      #./mobile.nix  
      #./network.nix  
      #./packet-generators.nix  
      #./password.nix  
      #./port-scanners.nix  
      #./proxies.nix  
      #./services.nix  
      #./smartcards.nix  
      #./terminals.nix  
      #./tls.nix  
      #./traffic.nix  
      #./tunneling.nix  
      #./voip.nix  
      #./web.nix  
      #./windows.nix  
      #./wireless.nix  
      #<home-manager/nixos>
  ];
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "America/Boise";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  #services.xserver.videoDriver = "virtualbox";
  #libinput.enable=true;
  
  # Enable the Budgie Desktop environment.
  ##services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.budgie.enable = true;
  # Configure keymap in X11
  services.xserver = {
    displayManager = { 
      sddm.enable = true;
      defaultSession = "none+awesome";
    };
    layout = "us";	
    xkbVariant = "";
    enable = true;
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.garettm = {
    isNormalUser = true;
    description = "GarettM";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  #nixpkgs.config.allowUnfree = true;
    
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.guest.x11 = true;
    pkgs.zip
    pkgs.unzip
    tmux
    dwm
    gh
    dwmbar
    neofetch
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    rustup
    wget
    alacritty
    neovim
    git
    python3
  ];
  #programs.home-manager.enable=true;
  #programs.home-manager.path = https://github.com/rycee/home-manager/archive/release-18.03.tar.gz;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
    nixpkgs.config.allowUnfree = true;
    virtualisation.virtualbox.host.enable = true;
    nixpkgs.config.virtualbox.host.enableExtensionPack = true;
    virtualisation.virtualbox.guest.enable = true;
    #virtualisation.virtualbox.guest.x11 = true;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

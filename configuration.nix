# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Riyadh";

  # Select internationalisation properties.
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
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ara";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
 
  # To use flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable sound with pipewire.
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
  users.users.bnzuhair = {
    isNormalUser = true;
    description = "bnzuhair";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;
  
  # for enabling zsh as default
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     kanata
  #  wget
  ];
# kanata (keyboard & and mouse)
services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [];
        # extraDefCfg = "process-unmapped-keys yes";
        config = ''
	;; only used and changed keys
	(defsrc
	  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc 
	  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \ 
	  caps a    s    d    f    g    h    j    k    l    ;    '    ret 
	  lsft z    x    c    v    b    n    m    ,    .    /    rsft 
	  lctl lmet lalt           spc            ralt rmet cmp  rctl 
	  mfwd mbck
	)

	(defvar
	  tap-time    130
	  hold-time   180
	  dance-time  10
	)
	(defalias
	    capEsc (tap-hold $tap-time $hold-time esc (caps-word 2000))

	    ctlA (tap-hold $tap-time $hold-time a lctl)
	    metS (tap-hold $tap-time $hold-time s lmet)
	    altD (tap-hold $tap-time $hold-time d lalt)
	    sftF (tap-hold $tap-time $hold-time f lsft)

	    sftJ (tap-dance $dance-time ((tap-hold $tap-time $hold-time j rsft) j))
	    altK (tap-dance $dance-time ((tap-hold $tap-time $hold-time k lalt) k))
	    metL (tap-dance $dance-time ((tap-hold $tap-time $hold-time l rmet) l))
	    ctl; (tap-dance $dance-time ((tap-hold $tap-time $hold-time ; rctl) ;))
	    
	    mctl (tap-hold $tap-time $hold-time mfwd lsft)
	    msft (tap-hold $tap-time $hold-time mbck lctrl)
	   
	   smbl (tap-hold $tap-time $hold-time (one-shot-press 1000 (layer-toggle smb)) (layer-while-held smb) )
	   movl (tap-hold $tap-time $hold-time (one-shot-press 1000 (layer-toggle mov)) (layer-while-held mov) )
	   numl (tap-hold $tap-time $hold-time (one-shot-press 1000 (layer-toggle nums)) (layer-while-held nums) )
	)

	(deflayer default
	    grv    1        2        3        4        5        6        7        8        9        0        -        =        bspc
	    tab    q        w        e        r        t        y        u        i        o        p        [        ]        \
	@capEsc    @ctlA    @metS    @altD    @sftF    g        h        @sftJ    @altK    @metL    @ctl;    '        ret
	    lsft   z        x        c        v        b        n        m        ,        .        /        rsft
	    lctl   lmet     @movl                    spc                          @smbl    rmet     cmp      rctl
	    @mctl  @msft
	)

	(deflayer mov
	  _        _        _        _        _        _        _        _        _        _        _        _        _        _
	  _        _        end      pgup     pgdn     home     home     pgup     pgdn     end      bspc     _        _        _
	  _        lctrl    lmet     lalt     lsft     _        lft      down     up       rght     ret      _        _
	  _        _        lft      up       down     rght     bspc     tab      _        _        del      _
	  _        _        _                              _                               @numl    _        _        _
	    @mctl  @msft
	)

	(deflayer smb
	  _        _        _        _        _        _        _        _        _        _        _        _        _        _ 
	  _        S-1      [        S-[        S-9      Quote    S-/      S-0      S-]      ]        S-\      _        _        _
	  _        S-7      S-5      S--      S-6      S-3      S-8      S-4      =        +        S-;        _        _
	  _        -        `        S-`      S-,      \        /        S-.      '        .        S-2        _
	  _        _        @numl                              _                               _        _        _        _
	    @mctl  @msft
	)
	(deflayer nums
	  _        _        _        _        _        _        _        _        _        _        _        _        _        _
	  _        _        _        _        _        _        _        _        _        _        _        _        _        _
	  _        1        2        3        4        5        6        7        8        9        0        _        _
	  _        _        _        _        _        _        _        _        _        _        _        _
	  _        _        _                              _                               _        _        _        _
	    @mctl  @msft
	)
        '';
      };
    };
  };

  
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

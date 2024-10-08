# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     kanata
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
}

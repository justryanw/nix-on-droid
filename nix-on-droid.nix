{ pkgs, ... }:

{
  environment.packages = with pkgs; [
    vim
    openssh
    curl

    (import ./scripts/share.nix { inherit pkgs; })

    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.11";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };

  user.shell = "${pkgs.zsh}/bin/zsh";

  terminal = {
    font = "${pkgs.fira-code-nerdfont}/share/fonts/truetype/NerdFonts/FiraCodeNerdFont-Regular.ttf";
    colors = {
      background = "#1F1F1F";
      foreground = "#1F1F1F";
    };
  };

  networking.hosts = {
    "200:f788:a3a9:56ae:d341:e3f7:c7f:c771" = [ "desktop" ];
    "202:8699:42dd:e354:50c5:5a7e:610b:1a18" = [ "laptop" ];
    "200:d13b:15e2:865:7c39:ad3f:fff6:cbbd" = [ "work" ];
    "200:5ec2:56e1:400a:a0e6:3266:d737:d89d" = [ "vm" ];
    "200:79ec:fa57:9588:9683:775e:d0ad:c6b9" = [ "kevin" ];
    "200:6e2:97ec:3a8a:eb8a:174e:e4dc:7ca1" = [ "pavilion" ];
    "201:e7ad:b13b:b71a:9ef2:123e:1e86:ffe0" = [ "phone" ];
    "201:e145:88cf:f359:a185:19a7:9772:94a" = [ "kev-tv" ];
    "201:f5ff:565:4fef:6597:9c51:654e:f08a" = [ "helen-phone" ];
    "201:1116:41e5:2a9d:23fe:c842:5a84:5f7c" = [ "tvbox" ];
    "192.168.0.198" = [ "inspired" ];
  };
}

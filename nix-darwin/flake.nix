{
  description = "My Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    nix-homebrew,
  }: let
    configuration = {pkgs, ...}: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
        pkgs.neovim
        pkgs.tmux
      ];

      fonts.packages = [
        (pkgs.nerdfonts.override {fonts = ["FiraCode"];})
      ];

      homebrew = {
        enable = true;
        casks = [
          "google-chrome"
          "firefox"
          "iina"
          "the-unarchiver"
          "wezterm"
          "slack"
          "raycast"
          "docker"
          "tableplus"
          "github"
          "visual-studio-code"
          "homerow"
        ];
        brews = [
          "nvm"
          "redis"

          # for kittl mono repo
          "pkg-config"
          "cairo"
          "pango"
          "libpng"
          "jpeg"
          "giflib"
          "librsvg"
        ];
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true; # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.suleman.home = "/Users/suleman";
      home-manager.backupFileExtension = "backup";
      nix.configureBuildUsers = true;
      nix.useDaemon = true;

      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;
      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        dock.tilesize = 55;
        dock.persistent-apps = [
          "/Applications/Google Chrome.app"
          "/Applications/WezTerm.app"
          "/Applications/Slack.app"
          "/Applications/TablePlus.app"
          "/Applications/GitHub Desktop.app"
        ];
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";

        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
      };
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Sulemans-MacBook-Pro
    darwinConfigurations."Sulemans-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.suleman = import ./home.nix;
          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix

          nix-homebrew.enable = true;
          nix-homebrew.user = "suleman";
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Sulemans-MacBook-Pro".pkgs;
  };
}

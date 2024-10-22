{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "suleman";
  home.homeDirectory = "/Users/suleman";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Makes sense for user specific applications that shouldn't be available system-wide
  home.packages = [
    pkgs.go
    pkgs.lua
    pkgs.luarocks

    pkgs.zoxide
    pkgs.fzf
    pkgs.starship
    pkgs.alejandra # for fomatting nix
    pkgs.lazygit # comandline git GUI
    pkgs.ripgrep
    pkgs.yt-dlp
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zshrc/.zshrc";
    ".config/wezterm".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm";
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/starship/starship.toml";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
    ".config/nix".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nix";
    ".config/nix-darwin".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nix-darwin";
    ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/tmux";
  };

  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.git = {
    enable = true;
    userEmail = "sulemank97@gmail.com";
    userName = "Suleman";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

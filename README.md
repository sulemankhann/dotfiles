# Dotfiles

This repository contains my personal dotfiles, configured to automate my development environment setup on macOS using [Nix](https://nixos.org/) and [nix-darwin](https://github.com/LnL7/nix-darwin). By following the instructions below, you'll be able to set up a fresh macOS system quickly and efficiently.

## Prerequisites

To set up this dotfiles configuration, ensure you have the following:
- macOS system (preferably the latest version).
- Internet access for package installations.

## Installation

1. **Install macOS Command Line Tools**  
   Open a terminal and install the Xcode command line tools:
   ```bash
   xcode-select --install
   ```
   
2. **Install Nix**  
  Follow these steps to install Nix and nix-darwin:
  - Install Nix:
  
    ```bash
     sh <(curl -L https://nixos.org/nix/install)
    ```

3. **Clone this Repository**  
  Clone the dotfiles repository to your local machine:

   ```bash
     git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   ```
   ```bash
     cd ~/.dotfiles
   ```
4. **Run the nix-darwin Command**  
  Apply the Nix configuration using nix-darwin:

   ```bash
     nix run nix-darwin --extra-experimental-features 'flakes nix-command'  -- switch --flake ~/dotfiles/nix-darwin
   ```

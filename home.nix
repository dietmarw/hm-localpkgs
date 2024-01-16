{ config, pkgs, ... }:

let
  # import the local flake so we can use the packages defined in it
  myFlake = import ./. {};
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hex";
  home.homeDirectory = "/home/hex";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello

    # local packages
    myFlake.packages.${system}.bsync
  ];

  home.shellAliases = {
    hm="home-manager";
    hmd="cd ~/.dotfiles";
    hmp="home-manager packages";
    hms="home-manager switch";
    hmu="nix flake update ~/.dotfiles/ && hms";
  };

   nixpkgs.config = {
    allowUnfree = true;
  };
}

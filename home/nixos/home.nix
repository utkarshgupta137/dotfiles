# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    ../common.nix
    ../programs/alacritty.nix
  ];

  home = {
    username = "utkarsh";
    homeDirectory = "/home/utkarsh";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

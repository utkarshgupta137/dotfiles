{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;

    package = lib.mkIf (pkgs.stdenv.isDarwin) pkgs.alacritty-vivid;

    settings = {
      window.option_as_alt = lib.mkIf (pkgs.stdenv.isDarwin) "Both";

      scrolling.history = 100000;

      font = {
        normal.family = "SauceCodePro Nerd Font";
        bold.style = "SemiBold";
        italic.style = "Medium Italic";

        size = if (pkgs.stdenv.isDarwin) then 13 else 6;

        builtin_box_drawing = true;
      };

      draw_bold_text_with_bright_colors = true;

      selection.save_to_clipboard = true;

      mouse.hide_when_typing = true;

      key_bindings = [
        { key = "Key1"; mods = "Command"; chars = "\\x1b1"; }
        { key = "Key2"; mods = "Command"; chars = "\\x1b2"; }
        { key = "Key3"; mods = "Command"; chars = "\\x1b3"; }
        { key = "Key4"; mods = "Command"; chars = "\\x1b4"; }
        { key = "Key5"; mods = "Command"; chars = "\\x1b5"; }
        { key = "Key6"; mods = "Command"; chars = "\\x1b6"; }
        { key = "Key7"; mods = "Command"; chars = "\\x1b7"; }
        { key = "Key8"; mods = "Command"; chars = "\\x1b8"; }
        { key = "Key9"; mods = "Command"; chars = "\\x1b9"; }
        { key = "Key0"; mods = "Command"; chars = "\\x1b0"; }
        { key = "T"; mods = "Command"; chars = "\\x1bT"; }
        { key = "N"; mods = "Command"; chars = "\\x1bN"; }
        { key = "T"; mods = "Command|Shift"; action = "CreateNewWindow"; }
        { key = "N"; mods = "Command|Shift"; action = "SpawnNewInstance"; }
      ] ++ lib.optionals (pkgs.stdenv.isDarwin) [
        { key = "LBracket"; mods = "Command"; chars = "\\x1bj"; }
        { key = "RBracket"; mods = "Command"; chars = "\\x1bk"; }
        { key = "LBracket"; mods = "Command|Shift"; chars = "\\x1bh"; }
        { key = "RBracket"; mods = "Command|Shift"; chars = "\\x1bl"; }
        { key = "Q"; mods = "Command"; action = "None"; }
        { key = "W"; mods = "Command"; action = "None"; }
      ] ++ lib.optionals (pkgs.stdenv.isLinux) [
        { key = "C"; mods = "Command"; action = "Copy"; }
        { key = "V"; mods = "Command"; action = "Paste"; }
      ];
    };
  };
}

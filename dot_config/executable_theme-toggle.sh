#!/bin/bash
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

CONFIG_DIR="$HOME/.config/alacritty"
LIGHT_ALACRITTY="$CONFIG_DIR/alacritty-light.toml"
DARK_ALACRITTY="$CONFIG_DIR/alacritty-dark.toml"
MAIN_ALACRITTY="$CONFIG_DIR/alacritty.toml"

if defaults read -g AppleInterfaceStyle &>/dev/null; then
  echo "🌞 Switching to light mode..."

  # macOS appearance
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false'

  # Alacritty theme
  ln -sf "$LIGHT_ALACRITTY" "$MAIN_ALACRITTY"
  pkill -USR1 alacritty

  # Borders (Catppuccin Latte style)
  borders active_color=0xff4c4f69 inactive_color=0xffccd0da width=4.0 &

else
  echo "🌙 Switching to dark mode..."

  # macOS appearance
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'

  # Alacritty theme
  ln -sf "$DARK_ALACRITTY" "$MAIN_ALACRITTY"
  pkill -USR1 alacritty

  # Borders (Catppuccin Frappe style)
  borders active_color=0xffe1e3e4 inactive_color=0xff303446 width=4.0 &
fi

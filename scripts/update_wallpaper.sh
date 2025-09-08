pkill -9 wallpaper_rotat
$HOME/.config/hypr/scripts/wallpaper_rotate.sh & disown
sleep 1
echo $(hyprctl hyprpaper listloaded) > $HOME/.local/currentwallpaper

# xrandr --output DP-4 --mode 3440x1440 --rate 120 --primary --right-of DP-2
# Instead, use sudo nvidia-settings:
# Set monitor rates, + Force Full Composition Pipeline (advance menu)
# In OpenGL Settings: disable "Sync to VBlank" and "Allow Flipping"
# Dont forget to set the environment (in ~/comfy_guration/dotfiles/home/environment) in /etc/environment
nvidia-settings --load-config-only
feh --bg-fill ~/pictures/wallpapers/pink_desert.jpg
bash ~/comfy_guration/scripts/home/polybar.sh


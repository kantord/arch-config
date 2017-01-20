# 1: plan
gnome-calendar &
urxvt -title "urxvt-planner" -cd "/home/kdani/plan" -hold -e nvim effort.md > /dev/null &
i3-msg "workspace 1; append_layout ~/repos/arch-config/layout/1-plan.json";
i3-msg "rename workspace 1 to 1: plan";

# 2: track
chromium --app=https://habitica.com &
i3-msg "workspace 2; append_layout ~/repos/arch-config/layout/2-track.json";
i3-msg "rename workspace 2 to 2: track";

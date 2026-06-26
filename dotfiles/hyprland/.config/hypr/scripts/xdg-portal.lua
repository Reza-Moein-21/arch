hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.on("hyprland.start", function()
    -- Your working script logic, directly in Lua
    hl.exec_cmd("sleep 1")
    hl.exec_cmd("killall -e xdg-desktop-portal-hyprland 2>/dev/null || true")
    hl.exec_cmd("killall xdg-desktop-portal 2>/dev/null || true")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland &")
    hl.exec_cmd("sleep 2")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal &")
end)

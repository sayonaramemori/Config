curl -OL https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-musl.zip && 
unzip yazi* &&
rm yazi*.zip &&
sudo mv yazi*/yazi /usr/bin/ &&
sudo mv yazi*/ya /usr/bin/ &&
rm yazi* -rf &&
ya pkg add h-hg/yamb && ya pkg add yazi-rs/plugins:full-border &&
echo "Finish Downloading Yazi" &&
cat << 'EOF' >> ~/.profile
function ra() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
EOF

mkdir -p ~/.config/yazi/
cat << 'EOF' > ~/.config/yazi/yazi.toml
[opener]
edit = [
	{run = "nvim %*", block = true, for = "windows" },
	{run = 'nvim "$@"',block=true, for = "unix"},
]
play = [
	{run = 'mpv "$@"', block = true, for = "unix" },
]
EOF

cat << 'EOF' > ~/.config/yazi/init.lua
-- You can configure your bookmarks by lua language
require("full-border"):setup() 
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
if ya.target_family() == "windows" then
  table.insert(bookmarks, {
    tag = "Scoop Local",
    
    path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
    key = "p"
  })
  table.insert(bookmarks, {
    tag = "Scoop Global",
    path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
    key = "P"
  })
end
table.insert(bookmarks, {
  tag = "Desktop",
  path = home_path .. path_sep .. "Desktop" .. path_sep,
  key = "d"
})

require("yamb"):setup {
  -- Optional, the path ending with path seperator represents folder.
  bookmarks = bookmarks,
  -- Optional, recieve notification everytime you jump.
  jump_notify = true,
  -- Optional, the cli of fzf.
  cli = "fzf",
  -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  -- Optional, the path of bookmarks
  path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
        (os.getenv("HOME") .. "/.config/yazi/bookmark"),
}

EOF


cat << 'EOF' > ~/.config/yazi/keymap.toml
[[manager.prepend_keymap]]
on = [ "b", "a" ]
run = "plugin yamb save"
desc = "Add bookmark"

[[manager.prepend_keymap]]
on = [ "b", "g" ]
run = "plugin yamb jump_by_key"
desc = "Jump bookmark by key"

[[manager.prepend_keymap]]
on = [ "b", "G" ]
run = "plugin yamb jump_by_fzf"
desc = "Jump bookmark by fzf"

[[manager.prepend_keymap]]
on = [ "b", "d" ]
run = "plugin yamb delete_by_key"
desc = "Delete bookmark by key"

[[manager.prepend_keymap]]
on = [ "b", "D" ]
run = "plugin yamb delete_by_fzf"
desc = "Delete bookmark by fzf"

[[manager.prepend_keymap]]
on = [ "b", "A" ]
run = "plugin yamb delete_all"
desc = "Delete all bookmarks"

[[manager.prepend_keymap]]
on = [ "b", "r" ]
run = "plugin yamb rename_by_key"
desc = "Rename bookmark by key"

[[manager.prepend_keymap]]
on = [ "b", "R" ]
run = "plugin yamb rename_by_fzf"
desc = "Rename bookmark by fzf"
EOF



echo "Finish Config Yazi"



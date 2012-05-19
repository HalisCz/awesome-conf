-----------------------------------------------------------------------------------------------------------
--        awesome 3.4.1 configuration file by fastlinux.eu <radek@fastlinux.eu>       --
-----------------------------------------------------------------------------------------------------------
--	     failsafe mode from http://www.markurashi.de/dotfiles/awesome/rc.lua         --
-----------------------------------------------------------------------------------------------------------
-- tento soubor slouzi k nahrani defaultniho konfigu pri chybe uzivatelova konfigu  --
--           nastaveni awesome wm je ulozenvo v souboru awesome.lua                    --
-----------------------------------------------------------------------------------------------------------
--           failsafe mode - if the current config fail, load the default rc.lua                --
-----------------------------------------------------------------------------------------------------------
require("awful")
require("naughty")

confdir = awful.util.getdir("config")
local rc, err = loadfile(confdir .. "/awesome.lua");
if rc then
    rc, err = pcall(rc);
    if rc then
        return;
    end
end

-- default configuration file - umisteni originalniho konfiguraku awesome
dofile("/etc/xdg/awesome/rc.lua");

for s = 1,screen.count() do
    mypromptbox[s].text = awful.util.escape(err:match("[^\n]*"));
end


-- show problem notification - zobrazi chybovou hlasku v pripade bugu v awesome.lua
naughty.notify{text="Awesome crashed during startup on " .. os.date("%d%/%m/%Y %T:\n\n") ..  err .. "\n", timeout = 0}

-----------------------------------------------------------------------------------------------------
--    awesome 3.4.1 configuration file by fastlinux.eu <radek@fastlinux.eu>    --
-----------------------------------------------------------------------------------------------------
--          vicious library from  http://git.sysphere.org/vicious/ is included          --
-----------------------------------------------------------------------------------------------------

-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- widget library
require("vicious")

-- Autorun programs
-- transparency throught xcompmgr
awful.util.spawn_with_shell("xcompmgr -cF &")
autorun = true
autorunApps =
{
	"setxkbmap -layout cz,us -option grp:alt_shift_toggle",
	"urxvtd -q -f -o",
	"conky -d -p 5",
	"xscreensaver -no-splash",
}
if autorun then
   for app = 1, #autorunApps do
       awful.util.spawn(autorunApps[app])
   end
end

-- {{{ Variable definitions
-- path to home directory (cesta k domovskemu adresari uzivatele)
homepath = os.getenv("HOME")

-- Themes define colours, icons, and wallpapers
-- beautiful.init("/usr/share/awesome/themes/default/theme.lua")
beautiful.init(homepath .. "/.config/awesome/themes/mseed/theme.lua")

-- This is used later as the default terminal and editor to run.
-- terminal = "xterm -bg black -fg white -fa terminus -fs 9"
terminal = "urxvtc"
editor = "gvim" or os.getenv("EDITOR")
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
--    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}
-- }}}

-- {{{ Tags
tags = {}
tags.settings = {
    { name = "term",  layout = layouts[1]  },
    { name = "work1", layout = layouts[1]  },
    { name = "work2",   layout = layouts[1]  },
    { name = "web",  layout = layouts[1]  },
    { name = "im",    layout = layouts[1], ncol = 3, nmaster = 1, mwfact = 0.2 },
    { name = "mail",    layout = layouts[1] },
--    { name = "grafx",     layout = layouts[11] },
    { name = "media",     layout = layouts[1] },
    { name = "office",   layout = layouts[11]  },
    { name = "temp", layout = layouts[11]  }
}

for s = 1, screen.count() do
    tags[s] = {}
    for i, v in ipairs(tags.settings) do
        tags[s][i] = tag({ name = v.name })
        tags[s][i].screen = s
        awful.tag.setproperty(tags[s][i], "layout", v.layout)
        awful.tag.setproperty(tags[s][i], "mwfact", v.mwfact)
        awful.tag.setproperty(tags[s][i], "hide",   v.hide)
    end
    tags[s][1].selected = true
end
-- }}}

-- {{{ Load menu - vlozi externi soubor s menu
-- Create a laucher widget and a main menu
require("menu_conf")
-- }}}

-- {{{
-- Function for show command output on screen 
-- Funkce pro vypsani vystupu prikazu na obrazovku
local function notify_cmd(title, cmd, spawn)

	-- Get data from command
	local out = awful.util.pread(cmd)
	
	-- Escape output
	out = awful.util.escape(out)
	
naughty.notify{text = title .. "\n" .. out, timeout = spawn}
	
end
-- }}}
	
-- {{{ Wibox

-- {{{ Reusable separators
spacer         = widget({ type = "textbox", name = "spacer" })
separator      = widget({ type = "textbox", name = "separator" })
spacer.text    = " "
separator.text = "|"
-- }}}

-- {{{ Volume level widget
-- Widget icon
-- volicon       = widget({ type = "imagebox", name = "volicon" })
-- volicon.image = image(beautiful.widget_vol)
-- Initialize widgets
volwidget     = widget({ type = "textbox", name = "volwidget" })
volbarwidget  = awful.widget.progressbar({ layout = awful.widget.layout.horizontal.rightleft })
-- Progressbar properties
volbarwidget:set_width(8)
volbarwidget:set_height(18)
volbarwidget:set_vertical(true)
volbarwidget:set_background_color(beautiful.fg_off_widget)
volbarwidget:set_border_color(nil)
volbarwidget:set_color(beautiful.fg_widget)
volbarwidget:set_gradient_colors({
    beautiful.fg_widget,
    beautiful.fg_center_widget,
    beautiful.fg_end_widget })
awful.widget.layout.margins[volbarwidget.widget] = { top = 2, bottom = 2 }
-- Register widgets
vicious.enable_caching(vicious.widgets.volume)
vicious.register(volwidget, vicious.widgets.volume, "$1%", 2, "Master")
vicious.register(volbarwidget, vicious.widgets.volume, "$1", 2, "Master")
-- Register buttons
volbarwidget.widget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn(terminal .. " -e alsamixer", false) end),
    awful.button({ }, 2, function () awful.util.spawn("amixer -q sset Master toggle", false) end),
    awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2dB+", false) end),
    awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2dB-", false) end)
))  volwidget:buttons( volbarwidget.widget:buttons() )
-- }}}

-- {{{ Battery state
-- Widget icon
-- baticon       = widget({ type = "imagebox", name = "baticon" })
-- baticon.image = image(beautiful.widget_bat)
-- Initialize widget
batwidget     = widget({ type = "textbox", name = "batwidget" })
-- Register widget
vicious.register(batwidget, vicious.widgets.bat, "$1$2%", 61, "BAT0")
-- }}}

-- Create a textclock widget - (datum a cas)
mytextclock = awful.widget.textclock({ align = "right" }, "%d.%m.%Y %H:%M" )

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        spacer,
        mylayoutbox[s],
        mytextclock,spacer,separator,
        s == 1 and mysystray or nil, separator,
        spacer,volwidget, spacer, volbarwidget.widget, separator,
        spacer, batwidget, separator,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show(true)        end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
	-- terminal
	awful.key({ "Mod1" }, "F1", function () awful.util.spawn(terminal) end),
	
	-- gmrun
	awful.key({ "Mod1" }, "F2", function () awful.util.spawn("gmrun") end),

	-- dmenu
	awful.key({ "Mod1" }, "F3", function () awful.util.spawn(homepath .. "/.config/awesome/scripts/dmenu.sh") end),

	-- vypnuti aplikace
	awful.key({ "Mod1" }, "F4", function () if client.focus then client.focus:kill() end end),
	
	-- Web search
    awful.key({ "Mod1" }, "F5", function ()
        awful.prompt.run({ prompt = "Web search: " }, mypromptbox[mouse.screen].widget,
            function (command)
                awful.util.spawn("firefox 'http://www.google.cz/search?q="..command.."'", false)
                if tags[mouse.screen][4] then awful.tag.viewonly(tags[mouse.screen][4]) end
            end)
    end),
    
    -- SSH connect
    awful.key({ "Mod1" }, "F6", function ()
        awful.prompt.run({ prompt = "SSH Connect: " }, mypromptbox[mouse.screen].widget,
            function (host) awful.util.spawn(terminal .. " -e ssh " .. host, false) end)
    end),
    
    -- Rdesktop connect
    awful.key({ "Mod1" }, "F7", function ()
        awful.prompt.run({ prompt = "Remote: " }, mypromptbox[mouse.screen].widget,
            function (host) awful.util.spawn(terminal .. " -e rdesktop -g 1024*762 -k cs_cz -u" .. host, false) end)       
    end),
	
	-- OpenVPN connect
	-- awful.key({ "Mod1" }, "F8", function () awful.util.spawn(homepath .. "/.config/awesome/scripts/openvpn_start.sh") end),
	awful.key({ "Mod1" }, "F8", function () awful.util.spawn(terminal .. "-hold -e '" .. homepath .. "/.config/awesome/scripts/openvpn_start.sh'") end),
	
	-- screenshot
	awful.key({ modkey }, "Print", function () awful.util.spawn("scrot 'shot_%Y%m%d-%H%M%S.png' -e 'mv $f ~/shots/ &amp; gthumb ~/shots/$f'") end),

	-- hlasitost
	--awful.key({ }       , "#121", function () awful.util.spawn(homepath .. "/.config/awesome/scripts/pvol.py -m", false) end),
	--awful.key({ }       , "#122", function () awful.util.spawn(homepath .. "/.config/awesome/scripts/pvol.py -c -5", false) end),
	--awful.key({ }       , "#123", function () awful.util.spawn(homepath .. "/.config/awesome/scripts/pvol.py -c 5", false) end),
    --awful.key({ modkey }, "#117", function () awful.util.spawn(homepath .. "/.config/awesome/scripts/pvol.py -p -c -5", false) end),
    --awful.key({ modkey }, "#112", function () awful.util.spawn(homepath .. "/.config/awesome/scripts/pvol.py -p -c 5", false) end),

	-- hlasitost - multimedialni tlacitka (thinkpad r61)
	awful.key({ }       , "#122", function () awful.util.spawn("amixer -q set Master 2- unmute") end),
	awful.key({ }       , "#123", function () awful.util.spawn("amixer -q set Master 2+ unmute") end),
	--awful.key({ modkey }, "#122", function () awful.util.spawn("amixer -q set PCM 2- unmute") end),
	--awful.key({ modkey }, "#123", function () awful.util.spawn("amixer -q set PCM 2+ unmute") end),

	-- zamknuti pc (lock)
	awful.key({ modkey }, "e", function () awful.util.spawn("xscreensaver-command -lock") end),

	-- plovouci okno na vsechny plochy
	awful.key({ modkey }, "s",   function () client.focus.sticky = not client.focus.sticky end),

	-- plovouci okno vzdy navrchu
	awful.key({ modkey }, "a",   function () client.focus.ontop = not client.focus.ontop end),

	-- schova okno
	awful.key({ modkey },          "d",   function () client.focus.hide = not client.focus.hide end),

	-- Notifikace - HELP
	awful.key({ modkey },          "F1",   function ()
		notify_cmd("Přidané klávesové zkratky: \n", "cat " .. homepath .. "/.config/awesome/help.txt", 20)
	end),

	-- Notifikace - main info
	awful.key({ modkey },          "F2",   function ()
		notify_cmd("Volné místo", "df -hT", 10)
	end),

	-- Notifikace - logs
	awful.key({ modkey },          "F3",   function ()
		notify_cmd("dmesg", "dmesg | tail -n 30", 10)
		-- notify_cmd("/var/log/Xorg.0.log", "cat /var/log/Xorg.0.log | tail", 5)
	end),
	
	-- Notifikace - net info
	awful.key({ modkey },          "F4",   function ()
		notify_cmd("Netstat ", "netstat -nat", 0)
	end),
	
	-- Notifikace - proc
	awful.key({ modkey },          "F5",   function ()
		notify_cmd("Procesy", "ps -u | tail -n 30", 10)
	end),	

	-- vertikalni a horzontalni resaiz oken
	awful.key({ modkey, "Mod1" }, "Down", function () awful.client.incwfact(0.05) end),
	awful.key({ modkey, "Mod1" }, "Up", function () awful.client.incwfact(-0.05) end),
	awful.key({ modkey, "Mod1" }, "Right", function () awful.tag.incmwfact( 0.05)    end),
	awful.key({ modkey, "Mod1" }, "Left", function () awful.tag.incmwfact(-0.05)    end),

	-- Zobrazí / schová titlebar (20px vysoky).
	awful.key({ modkey }, "q",   function () if client.focus.titlebar then awful.titlebar.remove(client.focus, { modkey = modkey, height = "20" }) else awful.titlebar.add(client.focus, { modkey = modkey, height = "20" }) end end)
	   	
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules 
-- pravidla pro ruzne aplikace (v jakem tagu a na jakem screenu)
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { }, properties = { }, callback = awful.client.setslave }, -- Start windows as slave
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
					 size_hints_honor = false,				-- zarovnává okna do roviny, namísto zarovnání na zobrazení celých řádků
                     buttons = clientbuttons } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "Wicd-client.py" },      -- plovoucí wicd
      properties = { floating = true } },
    { rule = { class = "openttd" },			-- openttd vždy na fullscreen	
      properties = { fullscreen = true } },
    { rule = { class = "Firefox" }, except = { instance = "Navigator" },            -- plovoucí firefox stahování 
      properties = { floating = true } },
    { rule = { class = "psi" },	 
      properties = { tag = tags[1][5] } },

    { rule = { class = "gimp" },
      properties = { floating = true,
					 tag = tags[1][6] } },
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][4] } },
    { rule = { class = "Thunderbird" },
      properties = { tag = tags[1][6] } },
    { rule = { class = "Liferea" },
      properties = { tag = tags[1][4] } },      
	{ rule = { class = "Claws-mail" },
      properties = { tag = tags[1][5] } },      
	{ rule = { class = "soffice" },
      properties = { tag = tags[1][8] } }, 
	{ rule = { class = "Inkscape" },
      properties = { tag = tags[1][6] } }, 
	{ rule = { class = "Blender" },
      properties = { tag = tags[1][6] } },
    { rule = { class = "Gajim.py" },
      properties = { tag = tags[1][5] } },
    { rule = { class = "Vlc" },
      properties = { tag = tags[1][7] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)

    -- Add a titlebar (zapne titlebar a nastavi mu vysku - height = "25")
    -- awful.titlebar.add(c, { modkey = modkey , height = "24"})

    -- Enable sloppy focus (fokus pri najeti mysi - bez nutnosti kliknout)
c:add_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
    and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

------------------------------------------------------------------
-- Mseed awesome menu file by fastlinux.eu <radek@fastlinux.eu> --
--    oddeleno z hlavniho konfiguraku - require("menu_conf")    --
------------------------------------------------------------------

-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymenu_grafika = {
   { "Mirage", "mirage", homepath .. "/.config/awesome/themes/icons/apps/mirage.png" },
--   { "Geeqie", "geeqie", homepath .. "/.config/awesome/themes/icons/apps/geeqie.png" },
   { "Gimp", "gimp", homepath .. "/.config/awesome/themes/icons/apps/gimp.png" },
   { "Inkscape", "inkscape", homepath .. "/.config/awesome/themes/icons/apps/inkscape.png" },
   { "Blender", "blender -w", homepath .. "/.config/awesome/themes/icons/apps/blender.png" },
   { "gColor2", "gcolor2", homepath .. "/.config/awesome/themes/icons/apps/gcolor2.png" }
}

mymenu_video = {
   { "SMPlayer", "smplayer", homepath .. "/.config/awesome/themes/icons/apps/smplayer.png" },
   { "Mplayer", "gmplayer", homepath .. "/.config/awesome/themes/icons/apps/mplayer.png" },
   { "Xine", "xine", homepath .. "/.config/awesome/themes/icons/apps/xine.png" },
   { "VLC", "vlc", homepath .. "/.config/awesome/themes/icons/apps/vlc.png" },
   { "Avidemux", "avidemux2_gtk", homepath .. "/.config/awesome/themes/icons/apps/avidemux_icon.png" },
   { "dvd:rip", "nohup dvdrip", homepath .. "/.config/awesome/themes/icons/apps/dvdrip.xpm" },
   { "RecordMyDesktop", "gtk-recordMyDesktop", homepath .. "/.config/awesome/themes/icons/apps/gtk-recordmydesktop.png" }
}

mymenu_audio = {
   { "Sonata", "sonata", homepath .. "/.config/awesome/themes/icons/apps/sonata.png" },
   { "Jajuk", homepath .. "/software/jajuk/jajuk", homepath .. "/.config/awesome/themes/icons/apps/sonata.png" },
   { "Audacious", "audacious", homepath .. "/.config/awesome/themes/icons/apps/audacious.png" },
   { "Audacity", "audacity", homepath .. "/.config/awesome/themes/icons/apps/audacity.png" },
   { "Asunder", "asunder", homepath .. "/.config/awesome/themes/icons/apps/asunder.png" },
   { "EasyTag", "easytag", homepath .. "/.config/awesome/themes/icons/apps/easytag.xpm" },
   { "Alsamixer", "xterm -e alsamixer", homepath .. "/.config/awesome/themes/icons/apps/alsamixer.png" },
   { "Aumix", "aumix", homepath .. "/.config/awesome/themes/icons/apps/aumix.xpm" }
}

mymenu_network = {
   { "Firefox", "firefox", homepath .. "/.config/awesome/themes/icons/apps/firefox.png" },
   { "Claws-Mail", "claws-mail", homepath .. "/.config/awesome/themes/icons/apps/mail.png" },
   { "Gajim", "gajim", homepath .. "/.config/awesome/themes/icons/apps/gajim.png" },
   { "Liferea", "liferea", homepath .. "/.config/awesome/themes/icons/apps/liferea.png" },
   { "StreamTuner", "streamtuner", homepath .. "/.config/awesome/themes/icons/apps/streamtuner.png" },
   { "Xchat", "xchat", homepath .. "/.config/awesome/themes/icons/apps/xchat.png" },
   { "FileZilla", "filezilla", homepath .. "/.config/awesome/themes/icons/apps/filezilla.png" },
   { "Transmission", "transmission", homepath .. "/.config/awesome/themes/icons/apps/transmission.png" },
   { "Wxdfast", "wxdfast", homepath .. "/.config/awesome/themes/icons/apps/wxdfast.png" },   
   { "Nmap", "kdesu nmapfe", homepath .. "/.config/awesome/themes/icons/apps/nmap.png" },
   { "Wireshark", "kdesu wireshark", homepath .. "/.config/awesome/themes/icons/apps/wireshark.png" }
}

mymenu_develop = {
   { "gVim", "gvim", homepath .. "/.config/awesome/themes/icons/apps/gvim.xpm" },
   { "NetBeans IDE", "netbeans.sh", homepath .. "/.config/awesome/themes/icons/apps/netbeans.png" },
   { "Geany", "geany", homepath .. "/.config/awesome/themes/icons/apps/geany.png" },
   { "Jedit", "jedit", homepath .. "/.config/awesome/themes/icons/apps/jedit.png" },
   { "Eclipse", "~/software/eclipse/./eclipse -vm /usr/lib/jvm/emul-linux-x86-java-1.6/bin/", homepath .. "/.config/awesome/themes/icons/apps/eclipse.png" },
   { "Dia", "dia", homepath .. "/.config/awesome/themes/icons/apps/dia.png" },
   { "SQuirreL", "~/software/SQuirreL SQL Client/squirrel-sql.sh" },
   { "PoEdit", "poedit", homepath .. "/.config/awesome/themes/icons/apps/poedit.png" },
   { "Glade", "glade-3", homepath .. "/.config/awesome/themes/icons/apps/glade-3.png" }
}

mymenu_office = {
   { "OO Writer", "lowriter", homepath .. "/.config/awesome/themes/icons/apps/ooo-writer.png" },
   { "OO Calc", "localc", homepath .. "/.config/awesome/themes/icons/apps/ooo-calc.png" },
   { "OO Impress", "loimpress", homepath .. "/.config/awesome/themes/icons/apps/ooo-impress.png" },
   { "OO Draw", "lodraw", homepath .. "/.config/awesome/themes/icons/apps/ooo-draw.png" },
   { "OO Base", "lobase", homepath .. "/.config/awesome/themes/icons/apps/ooo-base.png" },
   { "OO Math", "lomath", homepath .. "/.config/awesome/themes/icons/apps/ooo-math.png" },
   { "OSMO", "osmo", homepath .. "/.config/awesome/themes/icons/apps/osmo.png" },
   { "Xchm", "xchm", homepath .. "/.config/awesome/themes/icons/apps/xchm.xpm" },
   { "ePDFview", "epdfview", homepath .. "/.config/awesome/themes/icons/apps/epdfview.png" },
   { "Stardict", "stardict", homepath .. "/.config/awesome/themes/icons/apps/stardict.png" }
}

mymenu_science = {
   { "Galculator", "galculator", homepath .. "/.config/awesome/themes/icons/apps/calculator.png" },
   { "Celestia", "celestia", homepath .. "/.config/awesome/themes/icons/apps/celestia.png" },
   { "Stellarium", "stellarium", homepath .. "/.config/awesome/themes/icons/apps/stellarium.xpm" },
   { "Google Earth", "googleearth", homepath .. "/.config/awesome/themes/icons/apps/googleearth.png" },
   { "XAOS", "xaos" },
   { "gPeriodic", "gperiodic", homepath .. "/.config/awesome/themes/icons/apps/gperiodic.png" },
   { "xClock", "xclock" }
}

mymenu_utils = {
   { "Tux Commander", "tuxcmd", homepath .. "/.config/awesome/themes/icons/apps/tuxcmd.png" },
   { "PCManFM", "pcmanfm", homepath .. "/.config/awesome/themes/icons/apps/pcmanfm.png" },
   { "VirtualBox", "VirtualBox", homepath .. "/.config/awesome/themes/icons/apps/virtualbox-ose.png" },
   { "Xarchiver", "xarchiver", homepath .. "/.config/awesome/themes/icons/apps/xarchiver.png" },
   { "GParted", "gparted", homepath .. "/.config/awesome/themes/icons/apps/gparted.png" }
}

mymenu_games = {
   { "PySol", "pysol", homepath .. "/.config/awesome/themes/icons/apps/pysol.xpm" },
   { "Lbreakout2", "lbreakout2", homepath .. "/.config/awesome/themes/icons/apps/lbreakout2.png" },
   { "Foobillard", "foobillard", homepath .. "/.config/awesome/themes/icons/apps/foobillard.png" },
   { "Wesnoth", "wesnoth", homepath .. "/.config/awesome/themes/icons/apps/wesnoth.png" },
   { "LGeneral", "lgeneral", homepath .. "/.config/awesome/themes/icons/apps/lgeneral.png" },
   { "True Combat", "et-tcetest" },
   { "Enemy Territory", "et", homepath .. "/.config/awesome/themes/icons/apps/ET.xpm" },
   { "World of Warcraft", "wine ~/.wine/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/Wow.exe ", homepath .. "/.config/awesome/themes/icons/applications-games.png" },
}

mymenu_burning = {
   { "k3b", "k3b", homepath .. "/.config/awesome/themes/icons/apps/k3b.png" },
   { "Graveman", "graveman", homepath .. "/.config/awesome/themes/icons/apps/graveman.png" },
   { "Recorder", "recorder", homepath .. "/.config/awesome/themes/icons/apps/recorder.png" }
}

mymenu_configuration = {
   { "NVIDIA Settings", "nvidia-settings", homepath .. "/.config/awesome/themes/icons/apps/nvidia-settings.png" },
   { "Pozadí plochy", "nitrogen " .. homepath .. "/backgrounds/", homepath .. "/.config/awesome/themes/icons/apps/background.png" },
   { "Téma GTK", "lxappearance", homepath .. "/.config/awesome/themes/icons/apps/themes_setting.png" },
   { "Téma QT", "qtconfig", homepath .. "/.config/awesome/themes/icons/apps/themes_setting.png" },
   { "Spořič obrazovky", "xscreensaver-demo", homepath .. "/.config/awesome/themes/icons/apps/screensaver_setting.png" },
   { "Vypnout Spořič", "killall xscreensaver", homepath .. "/.config/awesome/themes/icons/apps/gtk-cancel.png" },
   { "Tiskárny - cups", "xdg-open http://localhost:631/", homepath .. "/.config/awesome/themes/icons/apps/printer.png" },
   { "------------------------"},
   { "Update MPD DB", "xterm -fa terminus -fs 12 -bg black -fg white -e mpd --create-db && xterm -e /etc/init.d/mpd restart", homepath .. "/.config/awesome/themes/icons/apps/reload.png" },
   { "Vypnout MPD", "killall mpd", homepath .. "/.config/awesome/themes/icons/apps/background.png", homepath .. "/.config/awesome/themes/icons/apps/stop.png" },
   { "Zapnout MPD", "mpd", homepath .. "/.config/awesome/themes/icons/apps/themes_setting.png", homepath .. "/.config/awesome/themes/icons/apps/start.png" },
   { "------------------------"},
   { "rc.lua", "geany " .. homepath .. "/.config/awesome/rc.lua", homepath .. "/.config/awesome/themes/icons/apps/geany.png" },
   { "awesome.lua", "geany " .. homepath .. "/.config/awesome/awesome.lua", homepath .. "/.config/awesome/themes/icons/apps/geany.png" },
   { "menu_conf.lua", "geany " .. homepath .. "/.config/awesome/menu_conf.lua", homepath .. "/.config/awesome/themes/icons/apps/geany.png" },
   { "autostart.sh", "geany " .. homepath .. "/.config/awesome/autostart.sh", homepath .. "/.config/awesome/themes/icons/apps/geany.png" },
   { "------------------------"},
   { "Reload .Xdefaults", "xrdb -load ~/.Xdefaults", homepath .. "/.config/awesome/themes/icons/apps/reload.png" },
   { "------------------------"},
   { "awesome", myawesomemenu, beautiful.awesome_icon }
   
}

mymainmenu = awful.menu.new({ items = { { "Spustit", "gmrun", homepath .. "/.config/awesome/themes/icons/apps/gmrun.png" },
										{ "Terminál", terminal, homepath .. "/.config/awesome/themes/icons/apps/terminal.png" },
										{ "Tux Commander", "tuxcmd", homepath .. "/.config/awesome/themes/icons/apps/tuxcmd.png"},
										{ " ------------------"},
										{ "Firefox", "firefox", homepath .. "/.config/awesome/themes/icons/apps/firefox.png" },
   										{ "Claws-Mail", "claws-mail", homepath .. "/.config/awesome/themes/icons/apps/mail.png" },
   										{ "Gajim", "gajim", homepath .. "/.config/awesome/themes/icons/apps/gajim.png" },
										{ " ------------------"},
										{ "Grafika", mymenu_grafika, homepath .. "/.config/awesome/themes/icons/applications-graphics.png" },
										{ "Video", mymenu_video, homepath .. "/.config/awesome/themes/icons/applications-multimedia.png" },
										{ "Audio", mymenu_audio, homepath .. "/.config/awesome/themes/icons/applications-audio.png" },
										{ "Sítě", mymenu_network, homepath .. "/.config/awesome/themes/icons/applications-internet.png" },
										{ "Vývoj", mymenu_develop, homepath .. "/.config/awesome/themes/icons/applications-development.png" },
										{ "Kancelář", mymenu_office, homepath .. "/.config/awesome/themes/icons/applications-office.png" },
										{ "Věda", mymenu_science, homepath .. "/.config/awesome/themes/icons/applications-accessories.png" },
										{ "Utility", mymenu_utils, homepath .. "/.config/awesome/themes/icons/applications-utilities.png" },
										{ "Hry", mymenu_games, homepath .. "/.config/awesome/themes/icons/applications-games.png" },
										{ "Vypalování", mymenu_burning, homepath .. "/.config/awesome/themes/icons/applications-burning.png" },
										{ " ------------------"},
										{ "Nastavení", mymenu_configuration, homepath .. "/.config/awesome/themes/icons/settings.png" },
										--{ "awesome", myawesomemenu, beautiful.awesome_icon },
										{ " ------------------"},
										{ "Xkill", "xkill", homepath .. "/.config/awesome/themes/icons/apps/xkill.png" },
										{ "Uspat display", "sleep 1; xset dpms force off", homepath .. "/.config/awesome/themes/icons/apps/display.png" },
										{ "Zamknout", "xscreensaver-command -lock", homepath .. "/.config/awesome/themes/icons/apps/lock.png" },
									--	{ "Suspend to RAM", "dbus-send --system --print-reply --dest="org.freedesktop.DeviceKit.Power" /org/freedesktop/DeviceKit/Power org.freedesktop.DeviceKit.Power.Suspend", homepath .. "/.config/awesome/themes/icons/apps/shutdown.png" }
									--	{ "Vypnout PC", "dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop", homepath .. "/.config/awesome/themes/icons/apps/shutdown.png" }
																			
                                      }
                            })
-- vypnuti a suspend z https://bbs.archlinux.org/viewtopic.php?pid=870326#p870326                            

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })

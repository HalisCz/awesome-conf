--------------------------------------------------------------------------
-- Mseed awesome theme made from ZendBurn theme  --
--------------------------------------------------------------------------
--                          radek@fastlinux.eu                           --
--------------------------------------------------------------------------
--                       Verze 0.5 pro Awesome 3.4.1              --
--------------------------------------------------------------------------

-- path to home directory
homepath = os.getenv("HOME")

-- {{{ Main
theme = {}
-- pro nastaveni pozadi se pouzije program nitrogen
theme.wallpaper_cmd = { "/usr/bin/nitrogen --restore" }
--theme.wallpaper_cmd = { "awsetbg /usr/share/awesome/themes/default/background.png" }
-- }}}

-- {{{ Styles
-- theme.font          = "Impact 13"
theme.font          = "Sans 8"

-- {{{ Colors
theme.fg_normal = "#aaaaaa"
theme.fg_focus  = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.bg_normal = "#222222"
theme.bg_focus  = "#3465A4"
theme.bg_urgent = "#FF0000"
-- }}}

-- {{{ Borders
theme.border_width  = "1"
theme.border_normal = "#222222"
theme.border_focus  = "#3465A4"
theme.border_marked = "#FF0000"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3465A4"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.fg_widget        = "#AAAAAA"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.fg_off_widget    = "#494B4F"
theme.bg_widget        = "#3F3F3F"
theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "180"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = homepath .. "/.config/awesome/themes/mseed/taglist/squarefz.png"
theme.taglist_squares_unsel = homepath .. "/.config/awesome/themes/mseed/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon = homepath .. "/.config/awesome/themes/mseed/awesome-icon.png"
theme.menu_submenu_icon = homepath .. "/.config/awesome/themes/mseed/submenu.png"
theme.tasklist_floating_icon = homepath .. "/.config/awesome/themes/mseed/tasklist/floating.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = homepath .. "/.config/awesome/themes/mseed/layouts/tile.png"
theme.layout_tileleft   = homepath .. "/.config/awesome/themes/mseed/layouts/tileleft.png"
theme.layout_tilebottom = homepath .. "/.config/awesome/themes/mseed/layouts/tilebottom.png"
theme.layout_tiletop    = homepath .. "/.config/awesome/themes/mseed/layouts/tiletop.png"
theme.layout_fairv      = homepath .. "/.config/awesome/themes/mseed/layouts/fairv.png"
theme.layout_fairh      = homepath .. "/.config/awesome/themes/mseed/layouts/fairh.png"
theme.layout_spiral     = homepath .. "/.config/awesome/themes/mseed/layouts/spiral.png"
theme.layout_dwindle    = homepath .. "/.config/awesome/themes/mseed/layouts/dwindle.png"
theme.layout_max        = homepath .. "/.config/awesome/themes/mseed/layouts/max.png"
theme.layout_fullscreen = homepath .. "/.config/awesome/themes/mseed/layouts/fullscreen.png"
theme.layout_magnifier  = homepath .. "/.config/awesome/themes/mseed/layouts/magnifier.png"
theme.layout_floating   = homepath .. "/.config/awesome/themes/mseed/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = homepath .. "/.config/awesome/themes/mseed/titlebar/close_focus.png"
theme.titlebar_close_button_normal = homepath .. "/.config/awesome/themes/mseed/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = homepath .. "/.config/awesome/themes/mseed/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = homepath .. "/.config/awesome/themes/mseed/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = homepath .. "/.config/awesome/themes/mseed/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = homepath .. "/.config/awesome/themes/mseed/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = homepath .. "/.config/awesome/themes/mseed/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = homepath .. "/.config/awesome/themes/mseed/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = homepath .. "/.config/awesome/themes/mseed/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = homepath .. "/.config/awesome/themes/mseed/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = homepath .. "/.config/awesome/themes/mseed/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = homepath .. "/.config/awesome/themes/mseed/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = homepath .. "/.config/awesome/themes/mseed/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = homepath .. "/.config/awesome/themes/mseed/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = homepath .. "/.config/awesome/themes/mseed/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = homepath .. "/.config/awesome/themes/mseed/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = homepath .. "/.config/awesome/themes/mseed/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = homepath .. "/.config/awesome/themes/mseed/titlebar/maximized_normal_inactive.png"
-- }}}

-- {{{ Widget icons (volume, battery)
-- theme.widget_bat    = homepath .. "/.config/awesome/themes/icons/widgets/bat.png"
-- theme.widget_vol    = homepath .. "/.config/awesome/themes/icons/widgets/vol.png"
-- }}}

-- }}}

return theme

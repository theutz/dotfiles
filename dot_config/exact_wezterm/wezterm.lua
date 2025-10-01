--   _________
--  < Startup >
--   ---------
--     \         ,        ,
--      \       /(        )`
--       \      \ \___   / |
--              /- _  `-/  '
--             (/\/ \ \   /\
--             / /   | `    \
--             O O   ) /    |
--             `-^--'`<     '
--            (_.)  _  )   /
--             `.___/`    /
--               `-----' /
--  <----.     __ / __   \
--  <----|====O)))==) \) /====
--  <----'    `--' `.__,' \
--               |        |
--                \       /
--          ______( (_  / \______
--        ,'  ,-----'   |        \
--        `--{__________)        \/

local w = require("wezterm")
local a = w.action
local c = {}
if w.config_builder then
	c = w.config_builder()
end
c:set_strict_mode(true)

--  _______________________
-- < Color scheme & colors >
--  -----------------------
--   \
--    \
--       /\_)o<
--      |      \
--      | O . O|
--       \_____/

local function get_appearance()
	if w.gui then
		return w.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "rose-pine"
	else
		return "rose-pine-dawn"
	end
end

c.color_scheme = scheme_for_appearance(get_appearance())
c.bold_brightens_ansi_colors = "BrightAndBold"
c.window_background_opacity = 1.0
-- c.macos_window_background_blur = 20
c.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}
c.text_background_opacity = 1.0
c.text_min_contrast_ratio = 1.0

-- Write system appearance to be consumed by other cli tools!
local appearance_file_path = w.home_dir .. "/.local/state/appearance"
c.set_environment_variables = {
	APPEARANCE_FILE = appearance_file_path,
}
local function write_appearance_to_disk()
	local appearance = "light"
	if get_appearance():find("Dark") then
		appearance = "dark"
	end
	local file = io.open(appearance_file_path, "w")
	if file then
		file:write(appearance)
		file:close()
	end
end
w.on("gui-startup", write_appearance_to_disk)
w.on("window-config-reloaded", write_appearance_to_disk)

--  _______
-- < Fonts >
--  -------
--        \   \_______
--  v__v   \  \   O   )
--  (oo)      ||----w |
--  (__)      ||     ||  \/\

c.font = w.font("Maple Mono NF", { weight = 400 })
c.font_size = 16
c.line_height = 1.4

--  ____
-- < UI >
--  ----
--   \
--    \   \
--         \ /\
--         ( )
--       .( o ).

c.quit_when_all_windows_are_closed = false
c.window_decorations = "RESIZE"
c.adjust_window_size_when_changing_font_size = false
c.window_close_confirmation = "AlwaysPrompt"
c.window_padding = {
	top = "16px",
	bottom = "4px",
	left = "8px",
	right = "0px",
}
c.use_fancy_tab_bar = false
c.show_tab_index_in_tab_bar = true
c.tab_max_width = 120
c.hide_tab_bar_if_only_one_tab = true
c.enable_tab_bar = true
c.tab_bar_at_bottom = true

--  _____________
-- < Environment >
--  -------------
--           \
--            \
--             \          __---__
--                     _-       /--______
--                __--( /     \ )XXXXXXXXXXX\v.
--              .-XXX(   O   O  )XXXXXXXXXXXXXXX-
--             /XXX(       U     )        XXXXXXX\
--           /XXXXX(              )--_  XXXXXXXXXXX\
--          /XXXXX/ (      O     )   XXXXXX   \XXXXX\
--          XXXXX/   /            XXXXXX   \__ \XXXXX
--          XXXXXX__/          XXXXXX         \__---->
--  ---___  XXX__/          XXXXXX      \__         /
--    \-  --__/   ___/\  XXXXXX            /  ___--/=
--     \-\    ___/    XXXXXX              '--- XXXXXX
--        \-\/XXX\ XXXXXX                      /XXXXX
--          \XXXXXXXXX   \                    /XXXXX/
--           \XXXXXX      >                 _/XXXXX/
--             \XXXXX--__/              __-- XXXX/
--              -XXXXXXXX---------------  XXXXXX-
--                 \XXXXXXXXXXXXXXXXXXXXXXXXXX/
--                   ""VXXXXXXXXXXXXXXXXXXV""

c.default_prog = { "zsh", "-c", "nu --login" }

--  ________________
-- < Text rendering >
--  ----------------
--    \
--     \
--     ____
--    /# /_\_
--   |  |/o\o\
--   |  \\_/_/
--  / |_   |
-- |  ||\_ ~|
-- |  ||| \/
-- |  |||_
--  \//  |
--   ||  |
--   ||_  \
--   \_|  o|
--   /\___/
--  /  ||||__
--     (___)_)

c.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

--  __________
-- < Keyboard >
--  ----------
--          \
--            \
--              \
--                                         &&,     ..&&*
--                                @&&&#       &%      ..&&
--                            &&&      &&/ &&&&   %/.   .@&
--                          &&    (((&             */   ..&
--                         &.                 &&&       .#&&.,&&&&,
--                   .&&&&&&               .&&.       .* ,%    ....&&
--               .&&(             %&(            .&.   *(((       ..&&
--             &&.   &,%    @(**.          &                   @&, ..&&
--            &&   &,#                  &((         /#      &%&,    .....%&&&
--            &                         #           &/#            .. .......&&&
--          &&&%                     .@&&                       &.        **#..(&/
--      (&&                   &///&                                        &*,...&(
--    &&              &(&.                    &,@                            ....&&
--   &&   ///.        (&           &(((.    *,.                  /.           ....&
--  &#   @/@                     .                     &(&       .#.&         ....&
-- /&          .,           /(                &///&     #(                   .....&
--  &           .,          &*@          ,                                  .....&&
--  &&                        &  .....  ..... ..,.. ....                   .....&&
--   &@                                                                  ......&&
--    &&           &&(.,.,./**********************/****/*//*(&&*        .....&&
--      .&&&@/,..,,,*******/*****/*****************************////////////&%
--          #&,.,/****/**********/*************************/*****/////////&&
--           &&.,****************/********************************///////&&
--            &&.*/*********/***************/****/****/**********///////%&
--             &&,******,&&&&&&&*******/****/****/******&&&&&&&**//////*&(
--             *&.*****&&   @&&&&&*****/****/*********&&   &&&&&&//////&&
--              &&,***(&&&&&&&&&&&&****/****/********#&&&&&&&&&&&&////&&
--               &&****&&&&&&&&&&&*****/*************/&&&&&&&&&&&////&&
--                &&*(((((&&&&&*********((((((((%*******,&&&&&(((((//&
--                 &(*************/****/&((((((#/**************/////&&
--                 (&*/***/*******/****/**,%&,****************/////&&
--                  &&********/********/************/***/*****////&&
--                    &&&&,************/*****************/////%&&&%
--                           &&&&&&&&&&&&&&&&&&&&&&&&&&&&&@

c.enable_kitty_keyboard = true
c.keys = {
	{ key = "[", mods = "SUPER", action = a.ActivateCopyMode },
	{ key = "]", mods = "SUPER", action = a.QuickSelect },
	{ key = "d", mods = "SUPER", action = a.SplitPane({ direction = "Right" }) },
	{ key = "D", mods = "SUPER|SHIFT", action = a.SplitPane({ direction = "Down" }) },
	{ key = "h", mods = "SUPER", action = a.ActivatePaneDirection("Left") },
	{ key = "H", mods = "SUPER|SHIFT", action = a.AdjustPaneSize({ "Left", 5 }) },
	{ key = "i", mods = "SUPER", action = a.ScrollToPrompt(-1) },
	{ key = "I", mods = "SUPER|SHIFT", action = a.ScrollToPrompt(1) },
	{ key = "j", mods = "SUPER", action = a.ActivatePaneDirection("Down") },
	{ key = "J", mods = "SUPER|SHIFT", action = a.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "SUPER", action = a.ActivatePaneDirection("Up") },
	{ key = "K", mods = "SUPER|SHIFT", action = a.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "SUPER", action = a.ActivatePaneDirection("Right") },
	{ key = "L", mods = "SUPER|SHIFT", action = a.AdjustPaneSize({ "Right", 5 }) },
	{ key = "n", mods = "SUPER|SHIFT", action = a.SpawnWindow },
	{ key = "o", mods = "SUPER", action = a.RotatePanes("Clockwise") },
	{ key = "O", mods = "SUPER|SHIFT", action = a.RotatePanes("CounterClockwise") },
	{ key = "t", mods = "SUPER", action = a.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "SUPER", action = a.CloseCurrentPane({ confirm = true }) },
	{ key = "W", mods = "SUPER|SHIFT", action = a.CloseCurrentTab({ confirm = true }) },
	{ key = "z", mods = "SUPER", action = a.TogglePaneZoomState },
}

--  _____________
-- < Status Bars >
--  -------------
-- \                             .       .
--  \                           / `.   .' "
--   \                  .---.  <    > <    >  .---.
--    \                 |    \  \ - ~ ~ - /  /    |
--          _____          ..-~             ~-..-~
--         |     |   \~~~\.'                    `./~~~/
--        ---------   \__/                        \__/
--       .'  O    \     /               /       \  "
--      (_____,    `._.'               |         }  \/~~~/
--       `----.          /       }     |        /    \__/
--             `-.      |       /      |       /      `. ,~~|
--                 ~-.__|      /_ - ~ ^|      /- _      `..-'
--                      |     /        |     /     ~-.     `-. _  _  _
--                      |_____|        |_____|         ~ - . _ _ _ _ _>

w.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name .. " "
	end
	window:set_right_status(name or "")
end)

--  __________________
-- < Notify on reload >
--  ------------------
--          \     ,-.      .-,
--           \    |-.\ __ /.-|
--            \   \  `    `  /
--                 /_     _ \
--               <  _`q  p _  >
--               <.._=/  \=_. >
--                  {`\()/`}`\
--                  {      }  \
--                  |{    }    \
--                  \ '--'   .- \
--                  |-      /    \
--                  | | | | |     ;
--                  | | |.;.,..__ |
--                .-"";`         `|
--               /    |           /
--               `-../____,..---'`

w.on("window-config-reloaded", function(window, _)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

--  _______
-- < Done! >
--  -------
--       \                    / \  //\
--        \    |\___/|      /   \//  \\
--             /0  0  \__  /    //  | \ \
--            /     /  \/_/    //   |  \  \
--            @_^_@'/   \/_   //    |   \   \
--            //_^_/     \/_ //     |    \    \
--         ( //) |        \///      |     \     \
--       ( / /) _|_ /   )  //       |      \     _\
--     ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
--   (( / / )) ,-{        _      `-.|.-~-.           .~         `.
--  (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
--  (( /// ))      `.   {            }                   /      \  \
--   (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
--              ///.----..>        \             _ -~             `.  ^-`  ^-_
--                ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
--                                                                   /.-~

return c

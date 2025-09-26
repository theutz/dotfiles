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

c.color_scheme = "Everforest Dark Hard (Gogh)"
c.bold_brightens_ansi_colors = "BrightAndBold"
c.window_background_opacity = 1.0
-- c.macos_window_background_blur = 20
c.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}
c.text_background_opacity = 1.0
c.text_min_contrast_ratio = 1.0

--  _______
-- < Fonts >
--  -------
--        \   \_______
--  v__v   \  \   O   )
--  (oo)      ||----w |
--  (__)      ||     ||  \/\
   
c.font = w.font("Berkeley Mono", { weight = 500 })
c.font_size = 14
c.line_height = 1.0

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
-- config.window_close_confirmation = "AlwaysPrompt"
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

c.default_prog = { "zsh", "-c", "nu" }

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
	{ key = "d", mods = "SUPER", action = a.SplitPane({ direction = "Right" }) },
	{ key = "D", mods = "SUPER|SHIFT", action = a.SplitPane({ direction = "Down" }) },
	{ key = "h", mods = "SUPER", action = a.ActivatePaneDirection("Left") },
	{ key = "j", mods = "SUPER", action = a.ActivatePaneDirection("Down") },
	{ key = "k", mods = "SUPER", action = a.ActivatePaneDirection("Up") },
	{ key = "l", mods = "SUPER", action = a.ActivatePaneDirection("Right") },
	{ key = "i", mods = "SUPER", action = a.ScrollToPrompt(-1) },
	{ key = "I", mods = "SUPER|SHIFT", action = a.ScrollToPrompt(1) },
	{ key = "n", mods = "SUPER", action = a.SpawnTab("CurrentPaneDomain") },
	{ key = "N", mods = "SUPER|SHIFT", action = a.SpawnWindow },
	{ key = "o", mods = "SUPER", action = a.RotatePanes("Clockwise") },
	{ key = "O", mods = "SUPER|SHIFT", action = a.RotatePanes("CounterClockwise") },
	{ key = "[", mods = "SUPER", action = a.ActivateCopyMode },
	{ key = "]", mods = "SUPER", action = a.QuickSelect },
	{ key = "z", mods = "SUPER", action = a.TogglePaneZoomState },
	{ key = "H", mods = "SUPER|SHIFT", action = a.AdjustPaneSize({ "Left", 5 }) },
	{ key = "J", mods = "SUPER|SHIFT", action = a.AdjustPaneSize({ "Down", 5 }) },
	{ key = "K", mods = "SUPER|SHIFT", action = a.AdjustPaneSize({ "Up", 5 }) },
	{ key = "L", mods = "SUPER|SHIFT", action = a.AdjustPaneSize({ "Right", 5 }) },
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

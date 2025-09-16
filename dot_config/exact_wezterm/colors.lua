return function(c, w)
	local function get_appearance()
		if w.gui then
			return w.gui.get_appearance()
		end
		return "Dark"
	end

	local function scheme_for_appearance(appearance)
		if appearance:find("Dark") then
			return "Catppuccin Mocha"
		else
			return "Catppuccin Latte"
		end
	end
	c.color_scheme = scheme_for_appearance(get_appearance())
	c.bold_brightens_ansi_colors = "BrightAndBold"

	local function background_opacity_for_appearance(appearance)
		if appearance:find("Dark") then
			return 0.9
		else
			return 0.9
		end
	end
	c.window_background_opacity = background_opacity_for_appearance(get_appearance())
	c.macos_window_background_blur = 20
	c.inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	}
	c.text_background_opacity = 0.8

	local function contrast_ratio_for_appearance(appearance)
		if appearance:find("Dark") then
			return 1.0
		else
			return 1.0
		end
	end
	c.text_min_contrast_ratio = contrast_ratio_for_appearance(get_appearance())
end

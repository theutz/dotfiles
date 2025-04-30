local s = require "config.spoons.spoon-install"

---@param path string file path to application
---@return string?
local function appID(path)
	local info = hs.application.infoForBundlePath(path)
	if info then
		return info["CFBundleIdentifier"]
	end
end

local vivaldi = "/Applications/Vivaldi.app"
local safari = "/Applications/Safari.app"
local chrome = "/Applications/Google Chrome.app"

---@param app string name of the app for `open`
---@return function
local function chromium_profile_opener(app)
	---@param profile string
	---@return function
	return function(profile)
		---@param url string
		return function(url)
			hs.task
				.new("/usr/bin/open", nil, {
					"-n",
					"-a",
					app,
					"--args",
					"--profile-directory=" .. profile,
					url,
				})
				:start()
		end
	end
end

local vivaldi_opener = chromium_profile_opener(vivaldi)
local work_opener = vivaldi_opener "Profile 1"
local personal_opener = vivaldi_opener "Default"
local chrome_opener = chromium_profile_opener(chrome)
local work_chrome_opener = chrome_opener "Default"

local browsers = {
	default = personal_opener,
	personal = personal_opener,
	work = work_opener,
	chrome = work_chrome_opener,
}

local cfg_path = os.getenv "XDG_CONFIG_HOME" or os.getenv "HOME" .. "/.config"

local URLFiles = {
	work = cfg_path .. "/url-dispatcher/work.txt",
}

s:andUse("URLDispatcher", {
	config = {
		default_handler = browsers.default,
		url_patterns = {
			{ URLFiles.work, browsers.work },
		},
	},
	loglevel = "debug",
	start = true,
})

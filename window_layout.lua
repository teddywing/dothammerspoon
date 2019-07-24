-- Do this when external monitor is connected
-- https://www.hammerspoon.org/docs/hs.screen.watcher.html
-- hs.screen.primaryScreen():name() == 'G247HL'
local function iterm2()
	-- TODO: Use `filter()` to get windows with title starting with "2. ". This
	-- code grabbed window 3 once.
	local win_2 = hs.application.find('com.googlecode.iterm2'):allWindows()[2]
	win_2:setFrame(hs.geometry.rect(-1253.0,23.0,793.0,873.0))
end


screen_watcher = hs.screen.watcher.new(function()
	if hs.screen.primaryScreen():name() == 'G247HL' then
		iterm2()
	end
end)
screen_watcher:start()

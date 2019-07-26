-- Do this when external monitor is connected
-- https://www.hammerspoon.org/docs/hs.screen.watcher.html
-- hs.screen.primaryScreen():name() == 'G247HL'
local function iterm2()
	for _, window in ipairs(hs.application.find('com.googlecode.iterm2'):allWindows()) do
		if window:title():match('^2%. ') then
			window:setFrame(hs.geometry.rect(-1253.0,23.0,793.0,873.0))
			return
		end
	end
end


screen_watcher = hs.screen.watcher.new(function()
	if hs.screen.primaryScreen():name() == 'G247HL' then
		iterm2()
	end
end)
screen_watcher:start()

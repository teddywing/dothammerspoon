-- Copyright (c) 2019  Teddy Wing
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <https://www.gnu.org/licenses/>.


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

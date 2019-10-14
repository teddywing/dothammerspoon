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


all_window_filter = hs.window.filter.new():setOverrideFilter({ visible = true })
window_positions = {}

local function window_positions_save(window, _app_name, event_type)
	local screen = hs.screen.primaryScreen():id()

	if event_type == hs.window.filter.windowsChanged then
		window_positions[screen] = {}

		for _, window in ipairs(all_window_filter:getWindows()) do
			window_positions[screen][window:id()] = window:frame()
		end
	elseif event_type == hs.window.filter.windowMoved then
		window_positions[screen][window:id()] = window:frame()
	end
end

local function window_positions_restore()
	local screen = hs.screen.primaryScreen():id()

	for id, frame in pairs(window_positions[screen]) do
		hs.window.get(id):setFrame(frame)
	end
end

-- Save window positions on load
window_positions_save(nil, nil, hs.window.filter.windowsChanged)

all_window_filter
	:subscribe(hs.window.filter.windowMoved, window_positions_save)
	:subscribe(hs.window.filter.windowsChanged, window_positions_save)


screen_watcher = hs.screen.watcher.new(function()
	window_positions_restore()
end)
screen_watcher:start()

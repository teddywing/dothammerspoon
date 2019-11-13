-- When an external monitor is connected, saves internal screen brightness when
-- locking the screen or sleeping. Restores the saved brightness level on
-- unlock or wake. Fixes OS X 10.15 Catalina's bullshit where unlocking my
-- machine caused the internal screen's brightness to be reset to the maximum.

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


cbb_brightness = hs.brightness.get()

half_hour = 60 * 30

cbb_logger = hs.logger.new('catalina_brightness_bullshit', 'debug')

function cbb_brightness_restore()
	hs.brightness.set(cbb_brightness)

	cbb_logger:d('restored brightness: ', cbb_brightness)
end

hs.timer.doEvery(half_hour, function()
	cbb_brightness = hs.brightness.get()

	cbb_logger:d('saved brightness: ', cbb_brightness)
end)

cbb_wake_watcher = hs.caffeinate.watcher.new(function(event_type)
	-- Only run if the external monitor is connected.
	if hs.screen.primaryScreen():name() ~= 'G247HL' then
		cbb_logger:d('no external monitor')

		return
	end

	if event_type == hs.caffeinate.watcher.screensDidUnlock then
		cbb_brightness_restore()
	end
end)
cbb_wake_watcher:start()

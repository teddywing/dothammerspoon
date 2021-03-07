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


-- Enable command line tool (http://www.hammerspoon.org/docs/hs.ipc.html)
require("hs.ipc")

require('application_switch')
require('catalina_brightness_bullshit')
require('gdrive_mouseover_item')
require('mouse')
require('terminal_tab_hotkeys')
require('ufo')
require('window_layout')

hs.loadSpoon('WindowMode')
spoon.WindowMode:bindHotkeys({ mode = {{'ctrl', 'option'}, 'w'} })


-- Shortcut to invert screen colours
hs.hotkey.bind({}, 'f8', function()
	hs.eventtap.keyStroke({'cmd', 'option', 'ctrl'}, '8')

	-- Counteract a Catalina bug where sometimes inverting screen colours with
	-- an external monitor connected makes the internal monitor's brightness
	-- change to 100%.
	if hs.screen.primaryScreen():name() == 'G247HL' then
		cbb_brightness_restore()
	end
end)

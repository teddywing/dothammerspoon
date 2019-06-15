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

require('window')
require('mouse')


-- Shortcuts to focus tabs in Terminal
terminal_app = hs.application.applicationsForBundleID('com.apple.Terminal')[1]

for i=0,9 do
	hs.hotkey.bind({"cmd", "alt"}, tostring(i), function()
		if terminal_app:isFrontmost() then
			local tab_index = i
			if i == 0 then
				tab_index = 10
			end

			hs.window.frontmostWindow():focusTab(tab_index)
		end
	end)
end


-- Maximise window height
hs.hotkey.bind({'ctrl', 'alt'}, 'z', function()
	local win = hs.window.frontmostWindow()
	local f = win:frame()

	f.h = hs.screen.mainScreen():frame().h
	win:setFrame(f)
end)


-- Shortcut to invert screen colours
hs.hotkey.bind({}, 'f8', function()
	hs.eventtap.keyStroke({'cmd', 'option', 'ctrl'}, '8')
end)

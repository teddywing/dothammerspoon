-- Opens a file in Google Drive by clicking a row by ID and sending a keyboard
-- shortcut to a user script to open the file.

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


gdrive_mouseover_item_mode = hs.hotkey.modal.new(
	{'ctrl', 'option'},
	'o',
	'GDrive Mouseover Item'
)
gdrive_mouseover_item_mode:bind(
	{'ctrl', 'option'},
	'o',
	'GDrive Mouseover Item Off',
	function() gdrive_mouseover_item_mode:exit() end
)

function gdrive_mouseover_item_select(id)
	local x_delta = 250
	local y_delta = 250

	y_delta = y_delta + (id * 48)

	local zoom_position = hs.window.frontmostWindow():zoomButtonRect()
	zoom_position.x = zoom_position.x + x_delta
	zoom_position.y = zoom_position.y + y_delta

	hs.mouse.setRelativePosition(zoom_position)
	hs.eventtap.leftClick(zoom_position)
end

function gdrive_mouseover_item_open()
	hs.eventtap.keyStroke({'ctrl', 'option', 'shift'}, 'o')
end

function gdrive_mouseover_item_run_and_exit(f)
	return function()
		hs.application.find('com.google.Chrome'):activate()

		f()
		gdrive_mouseover_item_open()

		gdrive_mouseover_item_mode:exit()
	end
end

for i = 0, 8 do
	local key = tostring(i + 1)

	gdrive_mouseover_item_mode:bind(
		{},
		key,
		gdrive_mouseover_item_run_and_exit(function()
			gdrive_mouseover_item_select(i)
		end)
	)
end

gdrive_mouseover_item_mode:bind(
	{},
	'0',
	gdrive_mouseover_item_run_and_exit(function()
		gdrive_mouseover_item_select(9)
	end)
)

for i, key in pairs({'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'}) do
	gdrive_mouseover_item_mode:bind(
		{},
		key,
		gdrive_mouseover_item_run_and_exit(function()
			gdrive_mouseover_item_select(i + 9)
		end)
	)
end

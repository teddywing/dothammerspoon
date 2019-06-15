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


units = {
	up_small    = { x = 0,  y = -5 },
	right_small = { x = 5,  y = 0 },
	down_small  = { x = 0,  y = 5 },
	left_small  = { x = -5, y = 0 },

	up_med    = { x = 0,   y = -20 },
	right_med = { x = 20,  y = 0 },
	down_med  = { x = 0,   y = 20 },
	left_med  = { x = -20, y = 0 },

	increase_right = { w = 5, h = 0 },
	increase_down  = { w = 0, h = 5 },

	decrease_up   = { w = 0,  h = -5 },
	decrease_left = { w = -5, h = 0 },

	increase_right_med = { w = 20, h = 0 },
	increase_down_med  = { w = 0,  h = 20 },

	decrease_up_med   = { w = 0,   h = -20 },
	decrease_left_med = { w = -20,  h = 0 },

	maximum = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}

window = {}
function window.up_small()
	hs.window.focusedWindow():move(units.up_small, nil, false, 0)
end

function window.right_small()
	hs.window.focusedWindow():move(units.right_small, nil, false, 0)
end

function window.down_small()
	hs.window.focusedWindow():move(units.down_small, nil, false, 0)
end

function window.left_small()
	hs.window.focusedWindow():move(units.left_small, nil, false, 0)
end

function window.up_med()
	hs.window.focusedWindow():move(units.up_med, nil, false, 0)
end

function window.right_med()
	hs.window.focusedWindow():move(units.right_med, nil, false, 0)
end

function window.down_med()
	hs.window.focusedWindow():move(units.down_med, nil, false, 0)
end

function window.left_med()
	hs.window.focusedWindow():move(units.left_med, nil, false, 0)
end


function window.relative_size(window, relative_size)
	local size = window:size()
	size.w = size.w + relative_size.w
	size.h = size.h + relative_size.h

	return size
end

function window.increase_right()
	hs.window.focusedWindow():setSize(
		window.relative_size(hs.window.focusedWindow(), units.increase_right)
	)
end

function window.increase_down()
	hs.window.focusedWindow():setSize(
		window.relative_size(hs.window.focusedWindow(), units.increase_down)
	)
end

function window.decrease_up()
	hs.window.focusedWindow():setSize(
		window.relative_size(hs.window.focusedWindow(), units.decrease_up)
	)
end

function window.decrease_left()
	hs.window.focusedWindow():setSize(
		window.relative_size(hs.window.focusedWindow(), units.decrease_left)
	)
end

function window.increase_right_med()
	hs.window.focusedWindow():setSize(
		window.relative_size(hs.window.focusedWindow(), units.increase_right_med)
	)
end

function window.increase_down_med()
	hs.window.focusedWindow():setSize(
		window.relative_size(hs.window.focusedWindow(), units.increase_down_med)
	)
end

function window.decrease_up_med()
	hs.window.focusedWindow():setSize(
		window.relative_size(hs.window.focusedWindow(), units.decrease_up_med)
	)
end

function window.decrease_left_med()
	hs.window.focusedWindow():setSize(
		window.relative_size(hs.window.focusedWindow(), units.decrease_left_med)
	)
end


function window.move_to_top()
	local position = hs.window.focusedWindow():topLeft()
	position.y = 0

	hs.window.focusedWindow():setTopLeft(position)
end


window_mode = hs.hotkey.modal.new({'ctrl', 'option'}, 'w', 'Window')
window_mode:bind({'ctrl', 'option'}, 'w', 'Window Off', function()
	window_mode:exit()
end)

window_mode:bind({'shift'}, 'k', window.up_small,    nil, window.up_small)
window_mode:bind({'shift'}, 'l', window.right_small, nil, window.right_small)
window_mode:bind({'shift'}, 'j', window.down_small,  nil, window.down_small)
window_mode:bind({'shift'}, 'h', window.left_small,  nil, window.left_small)

window_mode:bind({}, 'k', window.up_med,    nil, window.up_med)
window_mode:bind({}, 'l', window.right_med, nil, window.right_med)
window_mode:bind({}, 'j', window.down_med,  nil, window.down_med)
window_mode:bind({}, 'h', window.left_med,  nil, window.left_med)

window_mode:bind({}, 'i', window.move_to_top,  nil, window.move_to_top)

window_mode:bind({}, ']', function() hs.window.focusedWindow():moveOneScreenEast(true, false, 0) end)
window_mode:bind({}, '[', function() hs.window.focusedWindow():moveOneScreenWest(true, false, 0) end)

window_mode:bind({'shift'}, 'e', window.decrease_up,    nil, window.decrease_up)
window_mode:bind({'shift'}, 'd', window.increase_down,  nil, window.increase_down)
window_mode:bind({'shift'}, 'f', window.increase_right, nil, window.increase_right)
window_mode:bind({'shift'}, 's', window.decrease_left,  nil, window.decrease_left)

window_mode:bind({}, 'e', window.decrease_up_med,    nil, window.decrease_up_med)
window_mode:bind({}, 'd', window.increase_down_med,  nil, window.increase_down_med)
window_mode:bind({}, 'f', window.increase_right_med, nil, window.increase_right_med)
window_mode:bind({}, 's', window.decrease_left_med,  nil, window.decrease_left_med)

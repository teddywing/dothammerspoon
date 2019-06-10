units = {
	up_small    = { x = 0,  y = -5 },
	right_small = { x = 5,  y = 0 },
	down_small  = { x = 0,  y = 5 },
	left_small  = { x = -5, y = 0 },

	up_med    = { x = 0,   y = -20 },
	right_med = { x = 20,  y = 0 },
	down_med  = { x = 0,   y = 20 },
	left_med  = { x = -20, y = 0 },

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


window_mode = hs.hotkey.modal.new({'ctrl', 'option', 'shift'}, 'w', 'Window')
window_mode:bind({'ctrl', 'option', 'shift'}, 'w', 'Window Off', function()
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

window_mode:bind({}, ']', nil, nil, function() hs.window.focusedWindow():moveOneScreenEast() end)
window_mode:bind({}, '[', nil, nil, function() hs.window.focusedWindow():moveOneScreenWest() end)

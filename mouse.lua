mouse = {}
function mouse.bottom_left()
	local position = hs.mouse.getRelativePosition()
	position.x = position.x - 100
	position.y = position.y + 100
	hs.mouse.setRelativePosition(position)
end

function mouse.bottom()
	local position = hs.mouse.getRelativePosition()
	position.y = position.y + 100
	hs.mouse.setRelativePosition(position)
end

function mouse.bottom_right()
	local position = hs.mouse.getRelativePosition()
	position.x = position.x + 100
	position.y = position.y + 100
	hs.mouse.setRelativePosition(position)
end

function mouse.left()
	local position = hs.mouse.getRelativePosition()
	position.x = position.x - 100
	hs.mouse.setRelativePosition(position)
end

function mouse.click()
	local position = hs.mouse.getAbsolutePosition()
	hs.eventtap.leftClick(position)

	-- TODO: key down is mouse down, key up is mouse up
end

function mouse.right()
	local position = hs.mouse.getRelativePosition()
	position.x = position.x + 100
	hs.mouse.setRelativePosition(position)
end

function mouse.top_left()
	local position = hs.mouse.getRelativePosition()
	position.x = position.x - 100
	position.y = position.y - 100
	hs.mouse.setRelativePosition(position)
end

function mouse.top()
	local position = hs.mouse.getRelativePosition()
	position.y = position.y - 100
	hs.mouse.setRelativePosition(position)
end

function mouse.top_right()
	local position = hs.mouse.getRelativePosition()
	position.x = position.x + 100
	position.y = position.y - 100
	hs.mouse.setRelativePosition(position)
end


mouse_mode = hs.hotkey.modal.new({'ctrl', 'option', 'shift'}, 'm', 'Mouse')
mouse_mode:bind({'ctrl', 'option', 'shift'}, 'm', 'Mouse Off', function()
	mouse_mode:exit()
end)

mouse_mode:bind({}, 'pad1', mouse.bottom_left, nil, mouse.bottom_left)
mouse_mode:bind({}, 'pad2', mouse.bottom, nil, mouse.bottom)
mouse_mode:bind({}, 'pad3', mouse.bottom_right, nil, mouse.bottom_right)
mouse_mode:bind({}, 'pad4', mouse.left, nil, mouse.left)
mouse_mode:bind({}, 'pad5', mouse.click)
mouse_mode:bind({}, 'pad6', mouse.right, nil, mouse.right)
mouse_mode:bind({}, 'pad7', mouse.top_left, nil, mouse.top_left)
mouse_mode:bind({}, 'pad8', mouse.top, nil, mouse.top)
mouse_mode:bind({}, 'pad9', mouse.top_right, nil, mouse.top_right)

mouse = {}
function mouse.bottom_left(amount)
	return function()
		local position = hs.mouse.getRelativePosition()
		position.x = position.x - amount
		position.y = position.y + amount
		hs.mouse.setRelativePosition(position)
	end
end

function mouse.bottom(amount)
	return function()
		local position = hs.mouse.getRelativePosition()
		position.y = position.y + amount
		hs.mouse.setRelativePosition(position)
	end
end

function mouse.bottom_right(amount)
	return function()
		local position = hs.mouse.getRelativePosition()
		position.x = position.x + amount
		position.y = position.y + amount
		hs.mouse.setRelativePosition(position)
	end
end

function mouse.left(amount)
	return function()
		local position = hs.mouse.getRelativePosition()
		position.x = position.x - amount
		hs.mouse.setRelativePosition(position)
	end
end

function mouse.click()
	local position = hs.mouse.getAbsolutePosition()
	hs.eventtap.leftClick(position)

	-- TODO: key down is mouse down, key up is mouse up
end

function mouse.click_down()
	local position = hs.mouse.getAbsolutePosition()
	hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, position):post()
end

function mouse.click_up()
	local position = hs.mouse.getAbsolutePosition()
	hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, position):post()
end

function mouse.right(amount)
	return function()
		local position = hs.mouse.getRelativePosition()
		position.x = position.x + amount
		hs.mouse.setRelativePosition(position)
	end
end

function mouse.top_left(amount)
	return function()
		local position = hs.mouse.getRelativePosition()
		position.x = position.x - amount
		position.y = position.y - amount
		hs.mouse.setRelativePosition(position)
	end
end

function mouse.top(amount)
	return function()
		local position = hs.mouse.getRelativePosition()
		position.y = position.y - amount
		hs.mouse.setRelativePosition(position)
	end
end

function mouse.top_right(amount)
	return function()
		local position = hs.mouse.getRelativePosition()
		position.x = position.x + amount
		position.y = position.y - amount
		hs.mouse.setRelativePosition(position)
	end
end


mouse_mode = hs.hotkey.modal.new({'ctrl', 'option', 'shift'}, 'm', 'Mouse')
mouse_mode:bind({'ctrl', 'option', 'shift'}, 'm', 'Mouse Off', function()
	mouse_mode:exit()
end)

mouse_mode = hs.hotkey.modal.new({}, 'padclear', 'Mouse')
mouse_mode:bind({}, 'padclear', 'Mouse Off', function()
	mouse_mode:exit()
end)

mouse_mode:bind({}, 'pad1', mouse.bottom_left(100), nil, mouse.bottom_left(100))
mouse_mode:bind({}, 'pad2', mouse.bottom(100), nil, mouse.bottom(100))
mouse_mode:bind({}, 'pad3', mouse.bottom_right(100), nil, mouse.bottom_right(100))
mouse_mode:bind({}, 'pad4', mouse.left(100), nil, mouse.left(100))
mouse_mode:bind({}, 'pad5', mouse.click_down, mouse.click_up)
mouse_mode:bind({}, 'pad6', mouse.right(100), nil, mouse.right(100))
mouse_mode:bind({}, 'pad7', mouse.top_left(100), nil, mouse.top_left(100))
mouse_mode:bind({}, 'pad8', mouse.top(100), nil, mouse.top(100))
mouse_mode:bind({}, 'pad9', mouse.top_right(100), nil, mouse.top_right(100))

mouse_mode:bind({'shift'}, 'pad1', mouse.bottom_left(10), nil, mouse.bottom_left(10))
mouse_mode:bind({'shift'}, 'pad2', mouse.bottom(10), nil, mouse.bottom(10))
mouse_mode:bind({'shift'}, 'pad3', mouse.bottom_right(10), nil, mouse.bottom_right(10))
mouse_mode:bind({'shift'}, 'pad4', mouse.left(10), nil, mouse.left(10))
mouse_mode:bind({'shift'}, 'pad5', mouse.click)
mouse_mode:bind({'shift'}, 'pad6', mouse.right(10), nil, mouse.right(10))
mouse_mode:bind({'shift'}, 'pad7', mouse.top_left(10), nil, mouse.top_left(10))
mouse_mode:bind({'shift'}, 'pad8', mouse.top(10), nil, mouse.top(10))
mouse_mode:bind({'shift'}, 'pad9', mouse.top_right(10), nil, mouse.top_right(10))

mouse_mode:bind({'option'}, 'pad1', mouse.bottom_left(1), nil, mouse.bottom_left(1))
mouse_mode:bind({'option'}, 'pad2', mouse.bottom(1), nil, mouse.bottom(1))
mouse_mode:bind({'option'}, 'pad3', mouse.bottom_right(1), nil, mouse.bottom_right(1))
mouse_mode:bind({'option'}, 'pad4', mouse.left(1), nil, mouse.left(1))
mouse_mode:bind({'option'}, 'pad5', mouse.click)
mouse_mode:bind({'option'}, 'pad6', mouse.right(1), nil, mouse.right(1))
mouse_mode:bind({'option'}, 'pad7', mouse.top_left(1), nil, mouse.top_left(1))
mouse_mode:bind({'option'}, 'pad8', mouse.top(1), nil, mouse.top(1))
mouse_mode:bind({'option'}, 'pad9', mouse.top_right(1), nil, mouse.top_right(1))

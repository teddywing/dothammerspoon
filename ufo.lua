ufo_mode = hs.hotkey.modal.new({'ctrl', 'option'}, 'u', 'UFO')
ufo_mode:bind({'ctrl', 'option'}, 'u', 'UFO Off', function()
	ufo_mode:exit()
end)

ufo_mode:bind({}, 'escape', 'UFO Off', function()
	ufo_mode:exit()
end)

-- Reload the UFO Chrome extension
ufo_mode:bind({}, 'r', function()
	hs.eventtap.keyStroke({'command'}, '2')
	hs.eventtap.keyStroke({'shift'}, 'tab')
	hs.eventtap.keyStroke({}, 'tab')
	hs.eventtap.keyStroke({}, 'space')
	hs.eventtap.keyStroke({'command'}, '1')
	hs.eventtap.keyStroke({'command'}, 'r')

	ufo_mode:exit()
end)

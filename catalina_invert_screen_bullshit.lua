-- If F8 is pressed twice in under X seconds, do:
-- Press Apple-Option-F5, Shift-Tab 5 times, Space, Enter

function cisb_invert_screen()
	hs.eventtap.keyStroke({'cmd', 'option'}, 'F5')

	for _ = 1, 5 do
		hs.eventtap.keyStroke({'shift'}, 'tab')
	end

	hs.eventtap.keyStroke({}, 'space')
	hs.eventtap.keyStroke({}, 'return')
end

hs.hotkey.bind({'shift'}, 'F8', cisb_invert_screen)

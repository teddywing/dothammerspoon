local activateAllWindows = true

hs.hotkey.bind({}, 'f1', function()
	hs.application.find('com.apple.Terminal'):activate()
end)

hs.hotkey.bind({}, 'f2', function()
	hs.application.find('org.mozilla.nightly'):activate(activateAllWindows)
end)

hs.hotkey.bind({}, 'f3', function()
	hs.application.find('com.google.Chrome'):activate(activateAllWindows)
end)

hs.hotkey.bind({}, 'f4', function()
	hs.application.find('com.microsoft.rdc.osx.beta'):activate()
end)

-- Mode to activate lesser-used applications
application_switch_mode = hs.hotkey.modal.new({}, 'f13')

application_switch_mode:bind({}, 'l', function()
	hs.application.find('org.libreoffice.script'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 'w', function()
	hs.application.find('com.microsoft.Word'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 't', function()
	hs.application.find('com.googlecode.iterm2'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

-- TODO: Don't do that with a mode, just a list of keys, as the mode sometimes
-- doesn't activate quick enough

-- TODO: If we stick with F13, maybe bind keys under the left hand to make it usable without looking

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

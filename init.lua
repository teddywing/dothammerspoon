-- Enable command line tool (http://www.hammerspoon.org/docs/hs.ipc.html)
require("hs.ipc")


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

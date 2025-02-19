-- Copyright (c) 2019, 2025  Teddy Wing
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


local activateAllWindows = true

application_switch = {}

application_switch['f1'] = hs.hotkey.bind({}, 'f1', function()
	hs.application.find('com.apple.Terminal'):activate()
end)

application_switch['f2'] = hs.hotkey.bind({}, 'f2', function()
	hs.application.find('org.mozilla.nightly'):activate(activateAllWindows)
end)

application_switch['f3'] = hs.hotkey.bind({}, 'f3', function()
	hs.application.find('com.google.Chrome'):activate(activateAllWindows)
end)

application_switch['f4'] = hs.hotkey.bind({}, 'f4', function()
	local ms_remote_desktop = hs.application.find('com.microsoft.rdc.osx.beta')
	if ms_remote_desktop then
		ms_remote_desktop:activate()
	else
		hs.application.find('com.apple.iphonesimulator'):activate(activateAllWindows)
	end
end)

application_switch['f5'] = hs.hotkey.bind({}, 'f5', function()
	hs.application.find('com.googlecode.iterm2'):activate(activateAllWindows)
end)

application_switch['f6'] = hs.hotkey.bind({}, 'f6', function()
	hs.application.find('com.apple.iphonesimulator'):activate(activateAllWindows)
end)


-- Rebind Shift-F[n] to F[n]
for _, key in ipairs({'f1', 'f2', 'f3', 'f4', 'f5', 'f6'}) do
	hs.hotkey.bind({'shift'}, key, function()
		application_switch[key]:disable()

		hs.timer.doAfter(0.05, function()
			hs.eventtap.keyStroke({}, key)

			application_switch[key]:enable()
		end)
	end)
end


-- Mode to activate lesser-used applications
application_switch_mode = hs.hotkey.modal.new({}, 'f13')
application_switch_mode:bind({}, 'f13', function()
	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 'escape', function()
	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 'q', function()
	hs.application.find('org.libreoffice.script'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 'w', function()
	hs.application.find('com.microsoft.Word'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 'e', function()
	hs.application.find('com.apple.TextEdit'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 'x', function()
	hs.application.find('com.microsoft.Excel'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 'f', function()
	hs.application.find('com.googlecode.iterm2'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

application_switch_mode:bind({}, 'v', function()
	hs.application.find('com.apple.Preview'):activate(activateAllWindows)

	application_switch_mode:exit()
end)

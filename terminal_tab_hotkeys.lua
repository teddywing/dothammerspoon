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


-- Shortcuts to focus tabs in Terminal
terminal_app = hs.application.applicationsForBundleID('com.apple.Terminal')[1]

terminal_tab_hotkeys = {}

for i=0,9 do
	local key = tostring(i)

	terminal_tab_hotkeys[i] = hs.hotkey.bind({"cmd", "alt"}, key, function()
		if terminal_app:isFrontmost() then
			local tab_index = i
			if i == 0 then
				tab_index = 10
			end

			hs.window.frontmostWindow():focusTab(tab_index)
		end
	end)
end

function terminal_tab_hotkeys_enable()
	for _, v in pairs(terminal_tab_hotkeys) do
		v:enable()
	end
end

function terminal_tab_hotkeys_disable()
	for _, v in pairs(terminal_tab_hotkeys) do
		v:disable()
	end
end

application_watcher = hs.application.watcher.new(function(app_name, event_type, app)
	if app ~= nil and app_name == 'Terminal' then
		if event_type == hs.application.watcher.activated then
			terminal_tab_hotkeys_enable()
		elseif event_type == hs.application.watcher.deactivated then
			terminal_tab_hotkeys_disable()
		end
	end
end)

application_watcher:start()

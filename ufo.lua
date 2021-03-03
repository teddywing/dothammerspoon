-- Copyright (c) 2019, 2021  Teddy Wing
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


logger = hs.logger.new('ufo', 'debug')


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

-- Edit, close, and save an MS Word document
ufo_mode:bind({}, 'w', function()
	math.randomseed(os.time())
	local number = math.random(0, 9)

	hs.eventtap.keyStroke({}, 'forwarddelete')
	hs.eventtap.keyStroke({}, tostring(number))
	hs.eventtap.keyStroke({'command'}, 'w')
	hs.timer.doAfter(0.05, function()
		hs.eventtap.keyStroke({}, 'return')
	end)

	ufo_mode:exit()
end)


-- Shortcut to reload the UFO extension using Extreload
hs.hotkey.bind({}, 'f12', function()
	local output, status, type, rc = hs.execute('ufo-reload-extension', true)

	logger:d('reloaded UFO: ', output, status, type, rc)
end)

-- Copyright (c) 2021  Teddy Wing
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


-- Change keyboard layouts depending on presence of external keyboard.


keyboard_usb_watcher = hs.usb.watcher.new(function(event)
	if event['productName'] ~= 'iMate, USB To ADB Adaptor'
		or event['vendorID'] ~= 1917
		or event['productID'] ~= 1029
	then
		return
	end

	local product_name_contains_word_keyboard = string.find(
		string.lower(event['productName']),
		"keyboard"
	)
	if not product_name_contains_word_keyboard then
		return
	end

	if event['eventType'] == 'added' then
		hs.keycodes.setLayout('U.S.')
	elseif event['eventType'] == 'removed' then
		hs.keycodes.setLayout('QWAZERTY2')
	end
end)

keyboard_usb_watcher:start()

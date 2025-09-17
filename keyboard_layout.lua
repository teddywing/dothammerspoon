-- Copyright (c) 2021–2025  Teddy Wing
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


local function is_imate(event)
	return event['productName'] == 'iMate, USB To ADB Adaptor'
		and event['vendorID'] == 1917
		and event['productID'] == 1029
end

local function is_keychron(event)
	return event['productName'] == 'Keychron C2'
		and event['vendorID'] == 1452
		and event['productID'] == 591
end

local function is_kyria(event)
	return event['vendorID'] == 36125
		and event['productID'] == 40349
end

local function is_twaddle_choc(event)
	return event['vendorID'] == 65261
		and event['productID'] == 7391
end

local function is_generic_keyboard(event)
	local product_name_contains_word_keyboard = string.find(
		string.lower(event['productName']),
		"keyboard"
	)

	return product_name_contains_word_keyboard
end

keyboard_usb_watcher = hs.usb.watcher.new(function(event)
	if not is_imate(event)
		and not is_keychron(event)
		and not is_kyria(event)
		and not is_twaddle_choc(event)
		and not is_generic_keyboard(event)
	then
		return
	end

	if event['eventType'] == 'added' then
		hs.keycodes.setLayout('U.S.')
	elseif event['eventType'] == 'removed' then
		hs.keycodes.setLayout('QWAZERTY2')
	end
end)

keyboard_usb_watcher:start()

-- Copyright (c) 2023  Teddy Wing
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


-- Shortcuts to change keyboard layouts.
--
-- Mac OS 14 Sonoma so completely borked switching keyboard layouts that this
-- became a necessity. Since Mac OS 14, pressing Control-Space inconceivably no
-- longer reorders the list of keyboard layouts based on the most recently used
-- layout, meaning you can no longer press Control-Space-Space to go to the
-- one-indexed third layout, then press Control-Space to go back to the
-- previous layout. Instead, the Control-Space in the second step brings you to
-- a completely different layout. Yet another hostile change by Apple to make
-- Mac OS unusable.


local layouts = {
	"U.S.",
	"French – Numerical",
	"QWAZERTY2",
	"Dvorak"
};

keyboard_layout_select_bindings = {}

for i = 1, #layouts do
	local key = tostring(i)

	keyboard_layout_select_bindings[i] = hs.hotkey.bind(
		{"ctrl", "alt"},
		key,
		function()
			hs.keycodes.setLayout(layouts[i])
		end
	)
end

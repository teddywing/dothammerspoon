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


meet_csrfish = 'tRuEptc89Uu 1UdpeOl1SZWW8QjjVSj8cu9kv7di68YDGZH83gKdC3H725f xIo4MqFacxqInARWtTkhcmOWDLNL5bti6d22ZwqF'

meet_server = hs.httpserver.new(false, false)
meet_server:setInterface('loopback')
meet_server:setPort(3337)
meet_server:setCallback(function(method, path, headers, body)
	response_headers = {}
	response_headers['Access-Control-Allow-Origin'] = 'https://meet.google.com'
	response_headers['Vary'] = 'Origin'

	if method == 'POST' then
		url_parts = hs.http.urlParts(path)

		if not url_parts['queryItems']
			or not url_parts['queryItems'][1]
			or url_parts['queryItems'][1]['csrf'] ~= meet_csrfish
		then
			return '', 403, response_headers
		end

		if url_parts['path'] == '/volume-meet' then
			wasSet = hs.audiodevice.defaultOutputDevice():setOutputVolume(38)

			if not wasSet then
				return '', 500, response_headers
			end

			return '', 200, response_headers
		end
	end

	return '', 404, response_headers
end)

meet_server:start()

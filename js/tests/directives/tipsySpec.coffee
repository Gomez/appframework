###

ownCloud - App Framework

@author Bernhard Posselt
@copyright 2012 Bernhard Posselt nukeawhale@gmail.com

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
License as published by the Free Software Foundation; either
version 3 of the License, or any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU AFFERO GENERAL PUBLIC LICENSE for more details.

You should have received a copy of the GNU Affero General Public
License along with this library.  If not, see <http://www.gnu.org/licenses/>.

###

describe 'ocTipsy', ->

	beforeEach module 'OC'


	beforeEach inject ($rootScope, $compile) =>
		@$rootScope = $rootScope
		@$compile = $compile
		@host = $('<div id="host"></div>')
		$('body').append(@host)
		$.fx.off = true


	it 'should bind a normal tipsy element', =>
		elm = '<a href="#" id="mylink" oc-tipsy>test</a>'
		@elm = angular.element(elm)
		scope = @$rootScope
		@$compile(@elm)(scope)
		scope.$digest()
		@host.append(@elm)

		link = $(@host).find('#mylink')
		expect(link.data('tipsy')).not.toBe(undefined)


	it 'should allow to pass paremeters to tipsy', =>
		elm = '<a href="#" id="mylink" oc-tipsy="{
			delayIn: 3
		}">test</a>'
		@elm = angular.element(elm)
		scope = @$rootScope
		@$compile(@elm)(scope)
		scope.$digest()
		@host.append(@elm)

		link = $(@host).find('#mylink')
		delay = link.data('tipsy').options.delayIn
		expect(delay).toBe(3)

	afterEach =>
		@host.remove()
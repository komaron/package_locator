module PackageLocator
	module Carrier
	  class USPS

	    def initialize(tracking_number, session)
	 			@tracking_number = tracking_number
	 			@session = session
			end

			def self.locate_package(tracking_number,session)
	      agent = USPS.new(tracking_number,session)
	      agent.perform
	    end

	    def perform
	      @session.visit 'https://tools.usps.com/go/TrackConfirmAction_input'
	      @session.find(:css, 'textarea[id="tLabels"]').set @tracking_number
	      @session.find(:css, 'input[value="Find"]').click
	    end
		end
	end
end
module PackageLocator
  module Carrier
    class USPS < Factory

      def self.locate_package(tracking_number,session)
        agent = USPS.new(tracking_number,session)
        agent.perform
      end

      def tracking_url
        'https://tools.usps.com/go/TrackConfirmAction_input'
      end

      def fill_tracking_info
        @session.find(:css, 'textarea[id="tLabels"]').set @tracking_number
      end

      def submit
        @session.find(:css, 'input[value="Find"]').click
      end
    end
  end
end
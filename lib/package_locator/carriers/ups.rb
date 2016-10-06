module PackageLocator
  module Carrier
    class UPS < Factory

      def self.locate_package(tracking_number,session)
        agent = UPS.new(tracking_number,session)
        agent.perform
      end

      def tracking_url
        'https://www.ups.com/WebTracking/track?loc=en_us'
      end

      def fill_tracking_info
        @session.find(:css, 'textarea[id="trackNums"]').set @tracking_number
      end

      def submit
        @session.find(:css, 'input[value="Track"]').click
      end
    end
  end
end
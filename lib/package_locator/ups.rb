module PackageLocator
  module Carrier
    class UPS

      def initialize(tracking_number, session)
        @tracking_number = tracking_number
        @session = session
      end

      def self.locate_package(tracking_number,session)
        agent = UPS.new(tracking_number,session)
        agent.perform
      end

      def perform
        @session.visit 'https://www.ups.com/WebTracking/track?loc=en_us'
        @session.find(:css, 'textarea[id="trackNums"]').set @tracking_number
        @session.find(:css, 'input[value="Track"]').click
      end
    end
  end
end
module PackageLocator
  module Carrier
    class FedEx

      def initialize(tracking_number, session)
        @tracking_number = tracking_number
        @session = session
      end

      def self.locate_package(tracking_number,session)
        agent = FedEx.new(tracking_number,session)
        agent.perform
      end

      def perform
        @session.visit 'https://www.fedex.com/apps/fedextrack/'
        @session.find(:css, 'textarea[name="trackNumbers"]').set @tracking_number
        @session.find_button('Track').click
      end

    end
  end
end
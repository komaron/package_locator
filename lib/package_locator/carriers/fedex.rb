module PackageLocator
  module Carrier
    class FedEx < Factory

      def self.locate_package(tracking_number,session)
        agent = FedEx.new(tracking_number,session)
        agent.perform
      end

      def tracking_url
        'https://www.fedex.com/apps/fedextrack/'
      end

      def fill_tracking_info
        @session.find(:css, 'textarea[name="trackNumbers"]').set @tracking_number
      end

      def submit
        @session.find_button('Track').click
      end
    end
  end
end
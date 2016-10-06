module PackageLocator
  module Carrier
    class Factory
      attr_accessor :tracking_number

      def initialize(tracking_number, session)
        @tracking_number = tracking_number
        @session = session
      end

      def perform
        @session.visit tracking_url
        fill_tracking_info
        submit
        sleep 10
      end

      def fill_tracking_info
        raise NotImplementedError
      end

      def tracking_url
        raise NotImplementedError
      end

      def tracking_box
        raise NotImplementedError
      end

      def submit
        raise NotImplementedError
      end
    end
  end
end
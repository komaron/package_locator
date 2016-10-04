require 'capybara'

module PackageLocator
  class Core
    attr_accessor :session

    def initialize
      @session = PackageLocator::Core.register_session
    end

    def self.track_package(tracking_number, carrier)
      case carrier.downcase
      when 'ups'
        Carrier::UPS.locate_package(tracking_number)
      when 'usps'
        raise NotImplementedError
      when 'fedex'
        raise NotImplementedError
      else
        "Sorry, no support for carrier: #{carrier}"
      end
    end

    def self.register_session
      session = Capybara::Session.new(:selenium)
      session
    end
  end
end
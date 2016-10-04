require 'capybara'

module PackageLocator
  class Core

    def self.track_package(tracking_number, carrier)
      session = PackageLocator::Core.register_session
      case carrier.downcase
      when 'ups'
        Carrier::UPS.locate_package(tracking_number, session)
      when 'usps'
        Carrier::USPS.locate_package(tracking_number, session)
      when 'fedex'
        Carrier::FedEx.locate_package(tracking_number,session)
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
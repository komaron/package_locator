load 'lib/package_locator.rb'

describe PackageLocator::Core do
  before(:all) do
    @tracking = '1Z222W3373'
    @carrier = ['UPS', 'FedEx', 'USPS']
    @session = PackageLocator::Core.register_session
  end

  describe '#selenium_session' do
    context 'launching a capybara selenium sesion' do
      it { expect(@session).not_to be_nil }
    end
  end
end

describe PackageLocator::Carrier::FedEx do
  before(:all) do
    @url = 'https://www.fedex.com/apps/fedextrack/'
    @session = PackageLocator::Core.register_session
    @fedex = PackageLocator::Carrier::FedEx.new('1Z222W3373',@session)
  end

  describe '#FedEx initialize' do
    context 'verifying FedEx initialization' do
      it { expect(@fedex.tracking_number).to eq('1Z222W3373') }
    end
  end

  describe '#FedEx_tracking_url' do
    context 'verifying FedEx tracking url' do
      it { expect(@fedex.tracking_url).to eq('https://www.fedex.com/apps/fedextrack/')}
    end
  end
end
# Package Locator
I order a lot of stuff on various websites such as Amazon or eBay and checking shipping websites gets old, lets automate it.

Very standard approach to grabbing tracking information, given a tracking number and a carrier you will be returns a browser page with your tracking information.

### Improvements to come
  - DRY principle, better design
  - Get rid of Selenium and use either Mechanize or the carriers API
  - Return JSON of package details
  - Integrate with a rails/sinatra app

## Basic Usage
```bash
$ bundle exec ruby bin/track_package [tracking_number] [carrier]
```
Example:
```bash
bundle exec ruby bin/track_package 1Z12345644 UPS
```

## Supported Carriers
  * __UPS__
  * __USPS__
  * __FedEx__





lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'package_locator/core'
require 'package_locator/fedex'
require 'package_locator/ups'
require 'package_locator/usps'
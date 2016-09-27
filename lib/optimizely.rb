$:.unshift File.dirname(__FILE__) # For testing when no gem is installed.

require "net/http"
require "net/https"
require "uri"
require "json"
require "openssl"

require "optimizely/audience"
require "optimizely/engine"
require "optimizely/exceptions"
require "optimizely/experiment"
require "optimizely/project"
require "optimizely/stat"
require "optimizely/variation"
require "optimizely/version"

# Optimizely is a Ruby library for talking to the Optimizely Experiments API.
# Please see the README for usage documentation.
module Optimizely
  def self.new(*args)
  	Engine.new(*args)
  end
end

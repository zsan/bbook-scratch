$: << File.join(File.dirname(__FILE__), "/../lib")
require 'spec'
require 'bbook'
require 'webrat'
require 'time'
require 'hmac-md5'

Webrat.configure do |config|
	config.mode = :mechanize
end
#World(Webrat::Methods)
#World(Webrat::Matchers)


Spec::Runner.configure do |config|
	config.include(Webrat::Matchers, :type => [:integration])
#include Webrat::Matchers
	include Webrat::Methods
	include Webrat::HaveTagMatcher
end


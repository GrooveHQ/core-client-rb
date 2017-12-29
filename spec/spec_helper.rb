ENV['MOCK_CORE'] ||= 'true'
ENV['CORE_URL'] ||= "http://api-development.localdev.engineyard.com:9292"

require 'pry'
require 'pry-nav'
require 'tempfile'

Bundler.require(:default, :test)

require File.expand_path("../../lib/ey-core", __FILE__)
Dir[File.expand_path("../{shared,support}/*.rb", __FILE__)].each{|f| require(f)}

RSpec.configure do |config|
  config.order = "random"
  config.after(:each) do
    $stdout = STDOUT
    $stdin = STDIN
    $stderr = STDERR
  end

  RSpec::Matchers.define_negated_matcher :not_change, :change
end

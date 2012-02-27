require 'rspec'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'watir-page-helper'
require 'watir-webdriver'

module TestPage
  include WatirPageHelper

  direct_url "file://#{File.expand_path(File.dirname(__FILE__))}/test.html"
end
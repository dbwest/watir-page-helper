$: << File.dirname(__FILE__)
require 'watir-webdriver'
require 'watir-page-helper/commands'

include WatirPageHelper::Commands

WatirPageHelper.create
visit :my_page do |page|
  page.search_box = "Watirmelon"
  page.search
end
WatirPageHelper.close
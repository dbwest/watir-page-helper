require 'watir-webdriver'
require 'watir-page-helper/commands'

class MyPage < WatirPageHelper::Page
  direct_url "http://www.google.com"
  expected_element :text_field, :name => "q"
  expected_title "Google"
  text_field :search_box, :name => "q"
  button :search, :name => "btnG"
end

include WatirPageHelper::Commands

WatirPageHelper.create
visit MyPage do |page|
  page.search_box = "Watirmelon"
  page.search
end
WatirPageHelper.close
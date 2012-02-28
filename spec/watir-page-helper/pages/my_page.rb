module WatirPageHelper::MyPage
  extend WatirPageHelper::ClassMethods

  direct_url "http://www.google.com"
  expected_element :text_field, :name => "q"
  expected_title "Google"
  text_field :search_box, :name => "q"
  button :search, :name => "btnG"
end
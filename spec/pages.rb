class BaseTestPage < WatirPageHelper::Page
  TEST_URL = "file://#{File.expand_path(File.dirname(__FILE__))}/test.html"
  direct_url TEST_URL
end

class PageIncorrectTitle < BaseTestPage
  expected_title "not expected"
end

class PageIncorrectTitleRegExp < BaseTestPage
  expected_title /.*not expected.*/
end

class PageCorrectTitle  < BaseTestPage
  expected_title "HTML Document Title"
end

class PageCorrectTitleRegExp < BaseTestPage
  expected_title /^HTML Document Title$/
end

class PageExpectElement < BaseTestPage
  expected_element :text_field, :name => "firstname"
end

class PageExpectNonElement < BaseTestPage
  expected_element(:text_field, {:name => "doesntexist"}, 1)
end

class PageTextFields < BaseTestPage
  text_field :first_name, :name => "firstname"
end

class PageSelectList < BaseTestPage
  select_list :cars, :name => "cars"
end

class PageCheckbox < BaseTestPage
  checkbox :agree, :name => "agree"
end

class PageRadioButton < BaseTestPage
  radio :medium, :value => "Medium"
end

class PageButton < BaseTestPage
  button :submit, :value => "Submit"
end

class PageLink < BaseTestPage
  link :info, :text => "Information Link"
end

class PageTable < BaseTestPage
  table :test_table, :id => "myTable"
  row :test_table_row_1
  cell :test_table_row_1_cell_1
end

class PageDiv < BaseTestPage
  div :information, :id => "myDiv"
end

class PageNestedDiv < BaseTestPage
  div :my_nice_div, :id => 'myNiceDiv'
  div(:my_unnamed_div) { |page| page.my_nice_div_div.div }
  span(:my_unnamed_span) { |page| page.my_nice_div_div.span }
end

class PageNestedNoParams < BaseTestPage
  div :my_nice_div, :id => 'myNiceDiv'
  div(:my_unnamed_div) { my_nice_div_div.div }
  span(:my_unnamed_span) { my_nice_div_div.span }
end

class PageSpan < BaseTestPage
  span :background, :id => "mySpan"
end

class PageParagraph < BaseTestPage
  p :paragraph, :id => "myP"
end

class PageDlDtDd < BaseTestPage
  dl :definition_list, :id => "myDl"
  dt(:definition_type) { | page | page.definition_list_dl.dt }
  dd(:definition_data) { | page | page.definition_list_dl.dd }
end

class PageForm < BaseTestPage
  form :main_form, :name => "myForm"
end

class PageImage < BaseTestPage
  image :succulent_image, :id => "myImage"
end

class PageLi < BaseTestPage
  li :blue_item, :id => "blueLi"
end

class PageHeadings < BaseTestPage
  h1 :heading_one, :id => "myh1"
  h2 :heading_two, :id => "myh2"
  h3 :heading_three, :id => "myh3"
  h4 :heading_four, :id => "myh4"
  h5 :heading_five, :id => "myh5"
  h6 :heading_six, :id => "myh6"
end

class PageIFrame < BaseTestPage
  frame :iframe, :id => "myiframe"
  link(:ilink) { |page|  page.iframe.link(:text => 'Link in an iFrame') }
end

class PageFileField < BaseTestPage
  file_field :upload, :id => 'upload'
end
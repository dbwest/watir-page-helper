require 'helper'
require 'pages'

describe "Watir Page Helper" do
  include WatirPageHelper::Commands

  before(:all) { @browser = WatirPageHelper.create }
  after(:all) { @browser.close }

  it 'should support nesting of table elements' do
    visit :nested_table_page do |page|
      page.test_table.rows.length.should == 1
      page.test_table_row_1.should == "Test Table 2 Col 1 Test Table 2 Col 2"
      page.test_table_row_1_cell_1.should == "Test Table 2 Col 1"
    end
  end

  it 'should support nesting of div and span elements' do
    visit PageNestedDiv do |page|
      page.my_nice_div.should == "This div is unnamed and inside myNiceDiv.\nThis span is unnamed and inside myNiceDiv."
      page.my_unnamed_div.should == 'This div is unnamed and inside myNiceDiv.'
      page.my_unnamed_span.should == 'This span is unnamed and inside myNiceDiv.'
    end
  end

  it 'should support nesting without parameters' do
    visit PageNestedNoParams do |page|
      page.my_nice_div.should == "This div is unnamed and inside myNiceDiv.\nThis span is unnamed and inside myNiceDiv."
      page.my_unnamed_div.should == 'This div is unnamed and inside myNiceDiv.'
      page.my_unnamed_span.should == 'This span is unnamed and inside myNiceDiv.'
    end
  end

  it "should raise an error when the expected literal title doesn't match actual title" do
    lambda { visit PageIncorrectTitle }.should raise_error("Expected title 'not expected' instead of 'HTML Document Title'")
  end

  it "should raise an error when the expected title pattern doesn't match actual title" do
    lambda { visit PageIncorrectTitleRegExp }.should raise_error("Expected title '(?-mix:.*not expected.*)' instead of 'HTML Document Title'")
  end

  it "should go to the correct url on initialize if set in page class, and check correct literal title" do
    visit PageCorrectTitle do |page|
      page.url.should == BaseTestPage::TEST_URL
      page.title.should == "HTML Document Title"
    end
  end

  it "should go to the correct url on initialize if set in page class, and check correct title pattern" do
    visit PageCorrectTitleRegExp do |page|
      page.url.should == BaseTestPage::TEST_URL
      page.title.should =~ /^HTML Document Title$/
    end
  end

  it "should check the correct literal title of an existing open page" do
    visit PageCorrectTitle
    on PageCorrectTitle do |page|
      page.title.should == "HTML Document Title"
    end
  end

  it "should go to the correct url on initialize if set in page class, and check correct title pattern" do
    visit PageCorrectTitleRegExp
    on PageCorrectTitleRegExp do |page|
      page.title.should =~ /^HTML Document Title$/
    end
  end

  it "should check for the presence of an element when initializing a page" do
    visit PageExpectElement
    @browser.text_field(:name => "firstname").exist?.should be_true
  end

  it "should check for the presence of an element when initializing a page - and raise an error if not present" do
    lambda { on PageExpectNonElement }.should raise_error(/timed out after 1 seconds, waiting for.*doesntexist.*to become present/, Watir::Wait::TimeoutError)
    @browser.text_field(:id => "doesnt exist").exist?.should be_false
  end

  it "should support adding three methods for text fields" do
    visit PageTextFields do |page|
      page.first_name = "Test Name" #set
      page.first_name.should == "Test Name" #check
      page.first_name_text_field.exists?.should be_true #object
    end
  end

  it "should support adding four methods for select lists" do
    visit PageSelectList do |page|
      page.cars = "Mazda" #select
      page.cars.should == "Mazda" #check
      page.cars_selected?("Mazda").should be_true #selected?
      page.cars_select_list.exists?.should be_true #object
    end
  end

  it "should support adding four methods for checkboxes" do
    visit PageCheckbox do |page|
      page.check_agree
      page.agree?.should be_true
      page.uncheck_agree
      page.agree?.should be_false
      page.agree_checkbox.exist?.should be_true
      end
  end

  it "should support adding three methods for radio buttons" do
    visit PageRadioButton do |page|
      page.medium_set?.should be_false
      page.select_medium
      page.medium_set?.should be_true
      page.medium_radio_button.exist?.should be_true
    end
  end

  it "should support adding two methods for buttons" do
    visit PageButton do |page|
      page.submit
      page.submit_button.enabled?.should be_true
    end
  end

  it "should support adding two methods for links" do
    visit PageLink do |page|
      page.info
      page.info_link.exist?.should be_true
    end
  end

  it "should support adding one method for tables" do
    visit PageTable do |page|
      page.test_table.rows.length.should == 1
    end
  end

  it "should support adding two methods for table rows" do
    visit PageTable do |page|
      page.test_table_row_1.should == "Test Table Col 1 Test Table Col 2"
      page.test_table_row_1_row.cells.length.should == 2
    end
  end

  it "should support adding two methods for table cells" do
    visit PageTable do |page|
      page.test_table_row_1_cell_1.should == "Test Table Col 1"
      page.test_table_row_1_cell_1_cell.exist?.should be_true
    end
  end

  it "should support adding two methods for divs" do
    visit PageDiv do |page|
      page.information.should == "This is a header\nThis is a paragraph."
      page.information_div.exist?.should be_true
    end
  end

  it "should support adding two methods for spans" do
    visit PageSpan do |page|
      page.background.should == "Some background text in a span."
      page.background_span.should exist
    end
  end

  it "should support adding two methods for paragraphs" do
    visit PageParagraph do |page|
      page.paragraph.should == "This is a paragraph."
      page.paragraph_p.should exist
    end
  end

  it "should support adding two methods each for dl, dt, dd" do
    visit PageDlDtDd do |page|
      page.definition_list.should == "Succulents\n- water-retaining plants adapted to arid climates or soil conditions.\nCactus\n- plants who distinctive appearance is a result of adaptations to conserve water in dry and/or hot environments."
      page.definition_list_dl.exist?.should be_true
      page.definition_type.should == "Succulents"
      page.definition_type_dt.exist?.should be_true
      page.definition_data.should == "- water-retaining plants adapted to arid climates or soil conditions."
      page.definition_data_dd.exist?.should be_true
    end
  end

  it "should support adding two methods for a form" do
    visit PageForm do |page|
      page.main_form.should == "First name:\nLast name:\nCar model:\nHonda\nMazda\nToyota\n\nDo you agree?: I agree\nHigh\nMedium\nLow"
      page.main_form_form.should exist
    end
  end

  it "should support adding a method for a image" do
    visit PageImage do |page|
      page.succulent_image.exist?.should be_true
    end
  end

  it "should support adding two methods for a li" do
    visit PageLi do |page|
      page.blue_item.should == "Blue"
      page.blue_item_li.exist?.should be_true
    end
  end

  it "should support adding two methods for each heading attribute" do
    visit PageHeadings do |page|
      page.heading_one.should == "Heading One"
      page.heading_two.should == "Heading Two"
      page.heading_three.should == "Heading Three"
      page.heading_four.should == "Heading Four"
      page.heading_five.should == "Heading Five"
      page.heading_six.should == "Heading Six"
      page.heading_one_h1.exist?.should be_true
      page.heading_two_h2.exist?.should be_true
      page.heading_three_h3.exist?.should be_true
      page.heading_four_h4.exist?.should be_true
      page.heading_five_h5.exist?.should be_true
      page.heading_six_h6.exist?.should be_true
    end
  end

  it "should support elements within a iframe" do
    visit PageIFrame do |page|
      page.iframe.exist?.should be_true
      page.ilink_link.exist?.should be_true
      page.ilink
    end
  end

  it 'should support file upload fields' do
    visit PageFileField do |page|
      image_path = File.dirname(__FILE__) + '/image.png'
      page.upload = image_path #set
      page.upload.should == image_path #check
      page.upload_file_field.exist?.should be_true
    end
  end
end
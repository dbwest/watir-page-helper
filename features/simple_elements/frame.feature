Feature: frame
  As a web developer
  I want to locate frame elements
  So that I can write tests that make assertions about their content

  Background:
    When I define a page class as:
    """
    class PageWithFRAME < BasePageClass
      include WatirPageHelper
      frame :element, :id => 'frame_identifier'
    end
    """

  Scenario: frame element is located
    Then I should be able to locate the element with the following code:
    """
    page = PageWithFRAME.new true
    page.element_frame.exists?.should be_true
    """

  Scenario: frame text is extracted
    Then I should be able to execute the following assertion:
    """
    page = PageWithFRAME.new true
    page.element.should == 'frame expected content'
    """

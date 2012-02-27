require 'watir-webdriver'
require 'forwardable'

module WatirPageHelper
  class Page
    include WatirPageHelper
    extend Forwardable
    attr_reader :browser

    def_delegators :@browser, :title, :url, :html, :status, :refresh, :back

    def initialize browser
      @browser = browser
    end
  end

  class << self
    attr_accessor :browser

    def create
      @browser = ::Watir::Browser.new ENV['WEBDRIVER'] || :firefox
    end
  end

  module Commands
    def classify s
      s.to_s.split('_').map(&:capitalize).join
    end

    def page_class *args
      return args.first.new WatirPageHelper.browser if args.first.is_a? Class
      page = WatirPageHelper::Page.new WatirPageHelper.browser
      require "watir-page-helper/pages/#{args.join '/'}"
      mod = WatirPageHelper
      args.each do |name|
        mod = mod.const_get classify name
      end
      page.extend mod
      page
    end

    def on *args
      page_class(*args).tap do |p|
        p.expected_element if p.respond_to? :expected_element
        p.has_expected_title? if p.respond_to? :has_expected_title?
        yield p if block_given?
      end
    end

    def visit *args
      page_class(*args).tap do |p|
        p.goto
        p.expected_element if p.respond_to? :expected_element
        p.has_expected_title? if p.respond_to? :has_expected_title?
        yield p if block_given?
      end
    end
  end
end
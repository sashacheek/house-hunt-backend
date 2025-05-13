require 'selenium-webdriver'
require 'test/unit'
require 'dotenv/load'

class ReactAppTest < Test::Unit::TestCase
  def setup
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-logging')
    options.add_argument('--log-level=3')

    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.timeouts.implicit_wait = 5
  end

  def test_homepage_loads
    @driver.navigate.to ENV.fetch("ORIGINS")
    company_name = @driver.find_element(css: "#main-title")
    assert_equal(company_name.text, "HouseHunt")
  end

  def teardown
    @driver.quit
  end
end
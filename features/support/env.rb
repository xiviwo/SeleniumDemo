require 'rubygems'

require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox



Before do
  @driver = driver
end
 
at_exit do
  driver.quit
end
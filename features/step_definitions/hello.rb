

require 'rubygems'

require "selenium-webdriver"


When(/^I go to the homepage$/) do
  @driver.get('http://bit.ly/watir-example')
end


Then(/^I can input mutiple value$/) do
    @driver.find_element(:id, "entry_1000000").clear
    @driver.find_element(:id, "entry_1000000").send_keys "tom wu"
    @driver.find_element(:id, "entry_1000001").clear
    @driver.find_element(:id, "entry_1000001").send_keys "my story is long and this is not."
    @driver.find_element(:id, "group_1000002_2").click
    @driver.find_element(:id, "group_1000003_1").click
    @driver.find_element(:id, "group_1000003_2").click
    @driver.find_element(:id, "group_1000003_3").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "entry_1000004")).select_by(:text, "Firefox")
    @driver.find_element(:id, "group_1000005_5").click
    @driver.find_element(:id, "group_1000006_4").click
    @driver.find_element(:id, "group_1000007_5").click
end

Then(/^I can submit$/) do
  @driver.find_element(:id, "ss-submit").click
end


Then(/^I should see the successful message$/) do
  assert_equal "Your response has been recorded.", @driver.find_element(:css, "p").text
end



Selenium and Cucumber Example Demo
============
Similar demo to - [Watir demo](https://github.com/xiviwo/WatirDemo), the only difference is different driver used. Just fill in the form and submit, and user should be able to see response text with 'Your response has been recorded.'.

##Install Web driver of selenium for ruby 
```bash
sudo gem install selenium-webdriver
```

##Edit env.rb
```ruby
require 'rubygems'
require "selenium-webdriver"
driver = Selenium::WebDriver.for :firefox
Before do
  @driver = driver
end
 
at_exit do
  driver.quit
end
```

##Edit Steps

```ruby
require 'rubygems'
require "selenium-webdriver"

When(/^I go to the homepage$/) do
  @driver.get('http://bit.ly/watir-example')
end

Then(/^I can input mutiple value$/) do
    @driver.find_element(:id, "entry_1000000").clear
    @driver.find_element(:id, "entry_1000000").send_keys "alaph beta"
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
```

##Run 
```bash
cucumber

Feature: Hello Cucumber
As a product manager
I want our users to input value and submit the form
So that they can see successful msg

  Scenario: User sees the successful message # features/hello.feature:6
    When I go to the homepage                # features/step_definitions/hello.rb:8
    Then I can input mutiple value           # features/step_definitions/hello.rb:13
    Then I can submit                        # features/step_definitions/hello.rb:30
    Then I should see the successful message # features/step_definitions/hello.rb:35

1 scenario (1 passed)
4 steps (4 passed)
0m3.985s

```


require 'selenium-webdriver'

RSpec.configure do |config|

    config.before(:each) do 
        geckodriver = File.join(Dir.pwd, 'vendor', 'geckodriver')
        @driver = Selenium::WebDriver.for :firefox, driver_path: geckodriver
    end 

    config.after(:each) do 
        @driver.quit
    end 
end 

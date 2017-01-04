require 'selenium-webdriver'
require_relative '../pages/login' 

describe 'Login' do 

	before(:each) do 
		geckodriver = File.join(Dir.pwd, 'vendor', 'geckodriver')	
		@driver = Selenium::WebDriver.for :firefox, driver_path: geckodriver 
		@login = Login.new(@driver)
	end 

    after(:each) do 
    	@driver.quit 
    end 

    it 'succeeded' do 
    	@login.with('tomsmith', 'SuperSecretPassword!')
    	expect(@login.success_message_present?).to eql true
    end

    it 'failed' do 
    	@login.with('asdf', 'asdf')
    	expect(@login.failure_message_present?).to eql true
        #expect(@login.success_message_present?).to eql false 
    end 
end 

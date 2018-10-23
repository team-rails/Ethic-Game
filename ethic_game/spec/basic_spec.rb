require 'simplecov'
SimpleCov.start 'rails'

require_relative '../app/helpers/welcome_helper'

describe 'Test the welcome_helper' do
  describe '#welcome' do
      
    class DummyClass
    end
      
    before(:each) do
        @dummy_class = DummyClass.new 
        @dummy_class.extend(WelcomeHelper)
    end
      
    it 'should be defined' do
      expect { @dummy_class }.not_to raise_error
    end
    
  end
end
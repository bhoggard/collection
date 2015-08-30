require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'valid?' do
    contact = Contact.new(name: 'barry', email: 'abc@def.com', message: 'def')
    assert contact.valid?
  end
  test 'spam?' do
    contact = Contact.new(name: 'barry',
                          email: 'abc@def.com',
                          message: 'def',
                          nickname: 'i am a spambot')
    assert contact.spam?
  end
  test 'not spam?' do
    contact = Contact.new(name: 'barry', email: 'abc@def.com', message: 'def')
    refute contact.spam?
  end
end

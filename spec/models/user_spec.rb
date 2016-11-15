require 'rails_helper'
require 'spec_helper'

describe User do

  it 'validates name' do
    user = User.new(name: '')
    user.valid?
    expect(user.errors[:name]).not_to be_empty
  end

  it 'validates age' do
    user = User.new(age: '')
    user.valid?
    expect(user.errors[:age]).not_to be_empty
  end

end


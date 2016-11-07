require 'spec_helper'
require 'rails_helper'

describe ProductsController do

  before do
    get :index
  end

  it 'returns OK' do
    expect(response).to be_ok
  end


end
require 'spec_helper'
require 'rails_helper'

describe UsersController do

  before do
    get :index
  end

  it 'returns OK' do
    expect(response).to be_ok
  end

  describe 'show action' do
    it 'render show' do
      user = User.create(name: 'www', age: 22)
      get :show, params: {id: user.id}
      expect(response).to render_template('show')
    end
  end

  describe 'create action' do
    it 'when user creating pass' do
      post :create, params: {name: 'www', age: 22}
      expect(response).to redirect_to user_path(User.last)
    end

    it 'when user creating fail' do
      post :create, params: {name: 'www', age: nil}
      expect(response).to render_template('new')
    end
  end

  describe 'destroy action' do
    it 'destoy user' do
      user = User.create(name: 'www', age: 22)
      delete :destroy, params: {id: user.id}
      expect(response).to redirect_to users_path
    end
  end

  describe 'index action' do
    it 'render index' do
      user = User.create(name: 'www', age: 22)
      get :index, params: {id: user.id}
      expect(response).to render_template('index')
    end
  end

  describe 'new action' do
    it 'render new' do
      user = User.new
      get :new, params: {id: user.id}
      expect(response).to render_template('new')
    end
  end

  describe 'update action' do
    it 'user update pass' do
      @user = User.create(name: 'www', age: 22)
      put :update, params: {id: @user.id}
      expect(response).to redirect_to @user
    end

    it 'user update fail' do
      @user = User.create(name: 'www', age: 22)
      put :update, params: {id: @user.id}
      expect(response).to redirect_to @user
    end

   end

end
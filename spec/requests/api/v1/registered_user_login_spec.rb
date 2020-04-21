require 'rails_helper'

RSpec.describe 'I can create a user resource', :type => :request do
  before(:each) do
    @user = User.create({
                          email: "test@example.com",
                          password: "password",
                          password_confirmation: "password"
                        })
  end

  it 'can take in registration info and return that users API key' do

    post '/api/v1/sessions', params: {
                                      email: "test@example.com",
                                      password: "password"}.to_json,
                            headers: {
                                     'Content-Type' => 'application/json',
                                     'Accept' => 'application/json' }

    expect(response).to be_successful
    user_info = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(user_info).to eq({api_key: @user.api_key, :email=>"test@example.com"})
  end

  it 'will not authenticate a user with invalid information' do

    post '/api/v1/sessions', params: {
                                      email: "test@example.com",
                                      password: "password_1",}.to_json,
                             headers: {
                                        'Content-Type' => 'application/json',
                                        'Accept' => 'application/json'
                                       }

    expect(response).to_not be_successful
    errored_message = JSON.parse(response.body, symbolize_names: true)
    expect(errored_message[:failed]).to eq('Please check username and password. Login Failed')
  end
end

require 'rails_helper'

RSpec.describe 'User registration endpoint' do
  it 'It can take in registration from user and give user API key', :vcr do

    post '/api/v1/users', params: {
                                    email: 'whatever@example.com',
                                    password: 'password',
                                    password_confirmation: 'password'}.to_json,
                         headers: {
                                  'Content-Type' => 'application/json',
                                  'Accept' => 'application/json'
                                  }

    expect(response).to be_successful
    user_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    user = User.last
    expect(user.email).to eq('whatever@example.com')
    expect(user_key).to eq({api_key: user.api_key})
  end

  it 'Bad registration attempts not sucessfull and render faileduser serializer' do

    post '/api/v1/users', params: {
                                    email: 'whatever@example.com',
                                    password: 'password',
                                    password_confirmation: 'notthesame'}.to_json,
                         headers: {
                                  'Content-Type' => 'application/json',
                                  'Accept' => 'application/json'
                                  }

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:attributes].values.join).to eq("doesn't match Password")
  end

end

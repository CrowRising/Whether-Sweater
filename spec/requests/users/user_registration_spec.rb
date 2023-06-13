require 'rails_helper'

RSpec.describe 'User Registration API' do
  describe 'POST /api/v1/users' do
    it 'can create a new user' do
      details = {
        email: 'yourmom@aol.com',
        password: 'NoW@yJ0se',
        password_confirmation: 'NoW@yJ0se'
      }

      headers = {'CONTENT_TYPE' => 'application/json'}
      # require 'pry'; binding.pry
      post '/api/v1/users', headers: headers, params: JSON.generate(details)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user_details = JSON.parse(response.body, symbolize_names: true)
      new_user = User.last

      expect(user_details).to be_a Hash
      expect(user_details).to have_key :data
      expect(user_details[:data]).to be_a Hash
      expect(user_details[:data]).to have_key :id
      expect(user_details[:data][:id]).to eq(new_user.id.to_s)
      expect(user_details[:data]).to have_key :type
      expect(user_details[:data][:type]).to eq('users')
      expect(user_details[:data]).to have_key :attributes
      expect(user_details[:data][:attributes]).to be_a Hash
      expect(user_details[:data][:attributes]).to have_key :email
      expect(user_details[:data][:attributes][:email]).to eq(new_user.email)
      expect(user_details[:data][:attributes]).to have_key :api_key
      expect(user_details[:data][:attributes][:api_key]).to eq(new_user.api_key)
      expect(new_user.api_key.length).to eq(20)


    end
  end
end


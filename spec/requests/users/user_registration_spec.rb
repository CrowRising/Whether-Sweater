# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration API' do
  describe 'POST /api/v1/users' do
    it 'can create a new user' do
      details = {
        email: 'yourmom@aol.com',
        password: 'NoW@yJ0se',
        password_confirmation: 'NoW@yJ0se'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      # require 'pry'; binding.pry
      post '/api/v1/users', headers:, params: JSON.generate(details)

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
 
    it 'returns an error if email is already taken' do
      User.create!(email: 'yourmom@aol.com', password: 'NoW@yJ0se', password_confirmation: 'NoW@yJ0se', api_key: '12345678901234567890')
      details = {
        email: 'yourmom@aol.com',
        password: 'NoW@yJ0se',
        password_confirmation: 'NoW@yJ0se'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }  
      post '/api/v1/users', headers:, params: JSON.generate(details)

      expect(response).to_not be_successful
      expect(response.status).to eq(409)

      error_details = JSON.parse(response.body, symbolize_names: true)

      expect(error_details).to be_a Hash
      expect(error_details).to have_key :errors
      expect(error_details[:errors]).to be_an Array
      expect(error_details[:errors][0]).to have_key :detail
      expect(error_details[:errors][0][:detail]).to eq("Validation failed: Email has already been taken")
    end

    it 'returns an error if email or password is left blank' do
      details = {
        email: '',
        password: 'NoW@yJ0se',
        password_confirmation: 'N0W@yJ0se'
      }

      post '/api/v1/users', headers:, params: JSON.generate(details)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      error_details = JSON.parse(response.body, symbolize_names: true)

      expect(error_details).to be_a Hash
      expect(error_details).to have_key :errors
      expect(error_details[:errors]).to be_an Array
      expect(error_details[:errors][0]).to have_key :detail
      expect(error_details[:errors][0][:detail]).to eq("Validation failed: Email can't be blank, Password can't be blank")
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /api/v1/signup' do
    let(:signup_url) { '/api/v1/signup' }
    let(:login_url) { '/api/v1/login' }
    let(:logout_url) { '/api/v1/logout' }
    let(:user) { create(:user) }

    context 'when signup params are correct' do
      let(:valid_signup_params) do
        {
          user: {
            email: 'test_test@test.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end

      before do
        post signup_url, params: valid_signup_params.to_json, headers: json_headers
      end

      it 'returns 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns JWT token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end

      it 'can log out successfully' do
        token = response.headers['Authorization']
        delete logout_url, headers: { 'Authorization' => token }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when signup params are incorrect' do
      let(:invalid_signup_params) do
        {
          user: {
            email: '',
            password: ''
          }
        }
      end

      before do
        post signup_url, params: invalid_signup_params.to_json, headers: json_headers
      end

      it 'returns unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when login params are correct' do
      before do
        post login_url, params: login_params(user).to_json, headers: json_headers
      end

      it 'returns 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns JWT token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end
    end
  end

  def json_headers
    {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
  end

  def login_params(user)
    {
      "user": {
        "email": user.email,
        "password": user.password
      }
    }
  end
end

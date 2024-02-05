# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:book) { create(:book, author: user) }
  let(:valid_attributes) { attributes_for(:book) }
  let(:invalid_attributes) { attributes_for(:book, title: '') }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: book.to_param }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it 'does not allow non-owners to view the book' do
      sign_in user2
      get :show, params: { id: book.to_param }, format: :json

      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Book' do
        expect do
          post :create, params: { book: valid_attributes }, format: :json
        end.to change(Book, :count).by(1)
      end

      it 'renders a JSON response with the new book' do
        post :create, params: { book: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
      end

      context 'with invalid params' do
        it 'does not create a new Book' do
          expect do
            post :create, params: { book: invalid_attributes }, format: :json
          end.to change(Book, :count).by(0)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'does not allow non-owners to destroy the book' do
      sign_in user2
      delete :destroy, params: { id: book.to_param }, format: :json

      expect(response).to have_http_status(:forbidden)
    end

    it 'destroys the requested book' do
      book_to_destroy = create(:book, author: user)
      expect do
        delete :destroy, params: { id: book_to_destroy.to_param }, format: :json
      end.to change(Book, :count).by(-1)
    end

    it 'returns a success response' do
      delete :destroy, params: { id: book.to_param }, format: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end

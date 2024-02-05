# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      load_and_authorize_resource
      before_action :book, only: %i[show destroy]

      def index
        @books = Book.all.includes(:author)
        render json: @books, each_serializer: BookSerializer, status: :ok
      end

      def show
        authorize! :read, @book
        render json: @book, serializer: BookSerializer, status: :ok
      end

      def create
        @book = Book.new(book_params.merge(author: current_user))

        if @book.save
          render json: @book, serializer: BookSerializer, status: :created
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        authorize! :manage, @book
        @book.destroy
        head :no_content
      end

      private

      def book
        @book = Book.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:title)
      end
    end
  end
end

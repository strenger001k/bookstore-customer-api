# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to api_v1_books_path, status: :forbidden
  end
end

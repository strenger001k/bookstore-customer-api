# frozen_string_literal: true

module Api
  module V1
    class CurrentUserController < ApplicationController
      def index
        render json: current_user, serializer: UserSerializer, status: :ok
      end
    end
  end
end

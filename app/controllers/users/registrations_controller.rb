# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(current_user, _opts = {})
      if current_user.persisted?
        render json: current_user, serializer: UserSerializer, status: :ok
      else
        render json: {
          status: { code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
        }, status: :unprocessable_entity
      end
    end
  end
end

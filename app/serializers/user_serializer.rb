# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  jti                    :string           not null
#
class UserSerializer < ActiveModel::Serializer
  include DateFormatting

  attributes :id, :email, :formatted_created_at
  has_many :books

  def formatted_created_at
    formatted_date(object.created_at)
  end
end

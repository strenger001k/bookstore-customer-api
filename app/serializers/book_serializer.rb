# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  title      :string
#  author_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BookSerializer < ActiveModel::Serializer
  include DateFormatting

  attributes :id, :title, :formatted_created_at
  belongs_to :author

  def formatted_created_at
    formatted_date(object.created_at)
  end
end

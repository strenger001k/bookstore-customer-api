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
  attributes :id, :title, :created_at
  belongs_to :author
end

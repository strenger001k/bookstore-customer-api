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
class Book < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true
end

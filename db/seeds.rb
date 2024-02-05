# frozen_string_literal: true

require 'faker'

user = User.create!(
  email: 'user@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

p "Created #{User.count} User. #{user.email}:password123"

3.times do
  user.books.create!(
    title: Faker::Book.title
  )
end

p "Created #{Book.count} Books"

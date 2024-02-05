# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Book, author_id: user.id
    can :manage, Book, author_id: user.id
  end
end

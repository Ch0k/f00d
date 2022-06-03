# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.has_role? :admin
        admin_ability
      elsif user.has_role? :manager
        manager_ability
      elsif user.has_role? :customer
        customer_abiltiy
      end
    else
      guest_ability
    end
  end

  def admin_ability
    can :manage, :all
  end

  def manager_ability
    admin_ability
    cannot :read, User
    cannot :manage, User
  end

  def customer_abiltiy
    guest_ability
    can :create, Order
  end

  def guest_ability
    can :read, Product
  end
end

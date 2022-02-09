class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    can :read, Product, published: true
    can :manage, :cart, published: true

    return if user.blank?

    can %i(read destroy), Order, user: user

    return unless user.admin?

    can :manage, :all
  end
end

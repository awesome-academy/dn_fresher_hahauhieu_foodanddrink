class Ability
  include CanCan::Ability

  def initialize user
    can :read, Product
    return unless user

    if user.admin?
      can :manage, :all
    else
      can %i(new create), Order, user_id: user.id
      can :show, User, id: user.id
    end
  end
end

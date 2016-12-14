class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    can :read, Comment
    can :read, Article do |article|
      article.published?
    end


    user ||= User.new

    unless user.new_record?
      can :create, Comment, article: {:published? => true}
      can :destroy, Comment, user: user
      can :create, Mark do |mark|
        mark.article.user != user
      end
      #can :manage, Article, user: user, published: false
      can :create, Article do |article|
        not article.published?
      end

      cannot :make_publication
      can [:edit, :destroy, :show, :update], Article, user: user, published: false
      cannot :published, Article
      #cannot :published, Article

      case user.role
        when 'moderator'
          can :make_publication
          can :manage, Article, published: false
          can :published, Article
          can :manage, Comment
          cannot [:create, :update, :destroy], Article, published: true
        when 'admin' then can :manage, :all
      end
    end
    
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Comment
    can :read, Article
    # can :read, Article do |article|
    #   article.published?
    # end
    # can :show, Article, Article.where(published: true) do
    #   article.published?
    # end 
    #can :read, Article

    can [:read, :create], User


    user ||= User.new

    unless user.new_record?
      case user.role
        when 'user'    
          can :create, Comment, article: {:published? => true}
          can :destroy, Comment, user: user
          can :manage, User, id: user.id
          can :create, Mark do |mark|
            mark.article.user != user
          end
          
          can :create, Article do |article|
            not article.published?
          end

          cannot :make_publication
          can [:edit, :destroy, :show, :update], Article, user: user, published: false
          cannot :published, Article

          can :create, Response do |response|
            response.comment
          end

      
        when 'moderator'
          can :make_publication
          can :manage, Article
          can :manage, Response
          can :manage, Comment
          can :access, :rails_admin     
          can :dashboard  
        when 'admin'
          can :manage, :all
          can :access, :rails_admin     
          can :dashboard  
      end
    end
    
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :authenticate, :all if !user.new_record?

    # Post
    can :update, Post do |post|
      post.user.id == user.id
    end

    can :create, Post if !user.new_record?

    # Project
    can :update, Project do |project|
      project.users_include?(user)
    end

    can :create, Project if !user.new_record?

    # ProjectLogo
    can :create, ProjectLogo if !user.new_record?

    # SlideshowImage
    can :create, SlideshowImage if !user.new_record?

    # User
    can :update, User do |this_user|
      this_user.id == user.id
    end

    # UserAvatar
    can :create, UserAvatar if !user.new_record?
  end
end

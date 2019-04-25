class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true if !user.profile.nil?
  end

  def destroy?
    record.user == user
  end
end

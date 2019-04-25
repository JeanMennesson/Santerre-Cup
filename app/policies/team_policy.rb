class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def new?
    true if user.profile.inactive?
  end

  def create?
    true
  end

  def accept_player?
    record.user == user
  end

  def deny_player?
    record.user == user
  end

  # def close_subscriptions?
  #   record.user == user
  # end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end
end

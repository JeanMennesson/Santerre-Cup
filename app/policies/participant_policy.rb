class ParticipantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true if user.profile.player? && Participant.find_by(user_id: user.id).nil? || user.profile.inactive?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :team
  enum status: %i[pending accepted denied finished]
  # after_create :send_request_to_captain_email
  after_update :send_accepted_participant_email, if: :status_accepted?
  after_update :send_denied_participant_email, if: :status_denied?
  validate :participant_count_within_limit, on: :create
  validate :participant_quota, on: :update

  private

  def participant_quota
    if self.team.participants.pending.count >= 6
      errors.add(:base, "Cette équipe ne peux plus accueillir de joueurs !")
    end
  end

  def participant_count_within_limit
    if self.team.participants.accepted.count >= 6
      errors.add(:base, "Cette équipe ne peux plus accueillir de joueurs !")
    end
  end

  # def send_request_to_captain_email
  #   ParticipantMailer.pending_request_captain(id).deliver_now
  # end

  def send_accepted_participant_email
    ParticipantMailer.accepted_player_confirmation(id).deliver_now
  end

  def send_denied_participant_email
    ParticipantMailer.denied_player_cancellation(id).deliver_now
  end

  def status_accepted?
    Participant.find(id).status == "accepted"
  end

  def status_denied?
    Participant.find(id).status == "denied"
  end
end

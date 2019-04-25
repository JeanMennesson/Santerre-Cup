class ParticipantMailer < ApplicationMailer
  def accepted_player_confirmation(participant)
    @participant = Participant.find(participant)

    mail(
      to:       @participant.user.email,
      subject:  "Ta demande d'équipe a été acceptée !"
    )
  end

  def denied_player_cancellation(participant)
    @participant = Participant.find(participant)

    mail(
      to:       @participant.user.email,
      subject:  "Ta demande pour rejoindre l'équipe #{@participant.team.name} a été refusée !"
    )
  end

  def pending_request_captain(participant)
    @participant = Participant.find(participant)

    mail(
      to:       @participant.team.user.email,
      subject:  "Tu as une demande en cours !"
    )
  end
end

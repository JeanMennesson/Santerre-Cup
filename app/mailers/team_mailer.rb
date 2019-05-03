class TeamMailer < ApplicationMailer
  def creation_confirmation(team)
    @team = Team.find(team.id)

    mail(
      to:       @team.user.email,
      subject:  "Ton équipe #{@team.name} a été acceptée"
    )
  end

  def creation_cancellation(team)
    @team = Team.find(team.id)

    mail(
      to:       @team.user.email,
      subject:  "Ton équipe #{@team.name} a été refusée"
    )
  end
end

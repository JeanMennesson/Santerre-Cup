class ProfileMailer < ApplicationMailer
  def accepted_spectator_confirmation(profile)
    @profile = Profile.find(profile.id)

    mail(
      to:       @profile.user.email,
      subject:  "Ta demande comme specateur a été acceptée"
    )
  end

  def denied_spectator_cancellation(profile)
    @profile = Profile.find(profile.id)

    mail(
      to:       @profile.user.email,
      subject:  "Ta demande comme specateur a été refusée"
    )
  end
end

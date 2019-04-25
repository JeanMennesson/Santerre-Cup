class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @team = Team.find(params[:team_id])
    authorize @participant
  end

  def create
    @team = Team.find(params[:team_id])
    @participant = Participant.new(participant_params)
    @participant.team = @team
    @participant.user = current_user
    @participant.status = 0
    authorize @participant
    if @participant.save
      @participant.user.profile.update_attributes(status: "active")
      redirect_to mon_inscription_profile_path(@participant.user.profile), notice: 'Votre demande est en cours !'
    else
      render 'new'
      flash[:notice] = "Une erreur est survenue, veillez vérifier que vous avez bien rempli tous les champs demandés :)"
    end
  end

  def destroy
    @participant = Participant.where(user_id: current_user.id).last
    @participant.user.profile.update_attributes(status: "inactive")
    authorize @participant
    @participant.destroy
    redirect_to mon_inscription_profile_path(current_user.profile.id), notice: "Votre demande a été supprimée. N'hésitez pas à en faire une autre ou proposer votre équipe !"
  end

  private

  def participant_params
    params.require(:participant).permit(:team_id)
  end
end

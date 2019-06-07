class PullsController < ApplicationController
  before_action :set_profile, only: %i[new create]

  def new
    @pulls_ordered = Pull.all.where(profile_id: @profile.id)
    @pull = Pull.new
    authorize @pull
  end

  def create
    @pull = Pull.new(pull_params)
    @pull.profile = @profile
    authorize @pull
    if @pull.save
      redirect_to new_pull_path, notice: "Commande bien reçue"
    else
      flash.now[:notice] = "Impossible d'envoyer le message."
      render :new
    end
  end

  private

  def pull_params
    params.require(:pull).permit(:gender, :size, :number)
  end

  def set_profile
    @profile = current_user.profile
  end
end

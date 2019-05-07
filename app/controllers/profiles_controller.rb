class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update mon_inscription]

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile
    if @profile.save && @profile.role == "player"
      redirect_to teams_path
    elsif @profile.save && @profile.role == "spectator"
      redirect_to mon_inscription_profile_path(@profile)
    else
      render 'new'
      flash[:notice] = "Une erreur est survenue, veillez vérifier que vous avez bien rempli tous les champs demandés :)"
    end
  end

  def show
    @team = Team.find_by(user_id: current_user.id)
    authorize @profile
  end

  def edit
    authorize @profile
    @profile.save
  end

  def update
    @profile.update(profile_params)
    authorize @profile
    @profile.save
    redirect_to profile_path(@profile), notice: 'Votre profil a été mis à jour'
  end

  def mon_inscription
    @team = Team.find_by(user_id: current_user.id)
    @participant = Participant.where(user_id: current_user.id).last
    authorize @profile
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :user_id, :gender, :phone_number, :role, :dinner, :party)
  end

  def set_profile
    @profile = current_user.profile
  end
end

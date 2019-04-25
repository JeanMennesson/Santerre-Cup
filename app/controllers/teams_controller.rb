class TeamsController < ApplicationController
  before_action :set_team, only: %i[edit update destroy]
  before_action :set_player, only: %i[accept_player deny_player]

  def new
    @team = Team.new
    authorize @team
  end

  def index
    @men_teams = policy_scope(Team).where(status: 1, gender: 0)
    @women_teams = policy_scope(Team).where(status: 1, gender: 1)
    authorize @men_teams
    authorize @women_teams
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    @team.status = 0
    @team.gender = current_user.profile.gender
    authorize @team
    if @team.save
      @team.user.profile.update_attributes(role: :captain)
      @team.user.profile.update_attributes(status: "active")
      redirect_to teams_path
      flash[:notice] = "Ta demande a bien été envoyée !"
    else
      render :new
      flash[:notice] = "Une erreur est survenue, veillez réessayer"
    end
  end

  def show
    @team = Team.find(params[:id])
    @comment = Comment.new
    @potential_coplayers = @team.participants.pending
    @coplayers = @team.participants.accepted
    authorize @team
  end

  def edit
    authorize @team
  end

  def update
    @team.update(team_params)
    authorize @team
    @team.save
    redirect_to team_path(@team), notice: 'Votre équipe a été mise à jour'
  end

  def accept_player
    @team = Team.find(params[:id])
    @asking_player.update_attributes(status: "accepted")
    authorize @team
    @asking_player.save!
    redirect_to team_path(@team.id)
  end

  def deny_player
    @team = Team.find(params[:id])
    @asking_player.update_attributes(status: "denied")
    @asking_player.user.profile.update_attributes(status: "inactive")
    authorize @team
    @asking_player.save!
    redirect_to team_path(Team.find_by(user_id: current_user.id).id)
  end

  # def close_subscriptions
  #   @team = Team.find(params[:id])
  #   @team.update_attributes(status: "finished")
  #   authorize @team
  #   @team.save!
  #   redirect_to team_path(@team.id)
  # end

  private

  def participant_params
    params.require(:participant).permit(:participant_id)
  end

  def team_params
    params.require(:team).permit(:name, :motto, :description, :user_id, :status)
  end

  def set_player
    @asking_player = Participant.find(params[:participant_id])
  end

  def set_team
    @team = Team.find_by(user_id: params[:id])
  end
end

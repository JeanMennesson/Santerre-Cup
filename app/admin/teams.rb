ActiveAdmin.register Team do
  permit_params :name, :status

  scope :all
  scope :pending
  scope :accepted
  scope :denied

  action_item :accept, only: :show do
    link_to 'Accepter', accept_admin_team_path(team), method: :put
  end

  action_item :deny, only: :show do
    link_to 'Refuser', deny_admin_team_path(team), method: :put
  end

  action_item :pending, only: :show do
    link_to 'En Attente', pending_admin_team_path(team), method: :put
  end

  member_action :accept, method: :put do
    team = Team.find(params[:id])
    team.accepted!
    TeamMailer.creation_confirmation(team).deliver_now
    redirect_to admin_team_path(team)
  end

  member_action :deny, method: :put do
    team = Team.find(params[:id])
    captain = Team.find(params[:id]).user
    captain.profile.update_attributes(role: "player", status: "inactive")
    team.denied!
    TeamMailer.creation_cancellation(team).deliver_now
    redirect_to admin_team_path(team)
  end

  member_action :pending, method: :put do
    team = Team.find(params[:id])
    team.pending!
    redirect_to admin_team_path(team)
  end

  index do
    selectable_column
    column 'ID', :id
    column "Nom de l'équipe", :name
    column "Devise", :motto
    column 'Status', :status
    column 'Capitaine', :user
    column 'Joueur 2', :player_2
    column 'Joueur 3', :player_3
    column 'Joueur 4', :player_4
    column 'Joueur 5', :player_5
    column 'Joueur 6', :player_6
    column 'Joueur 7', :player_7
    column 'Joueurs proposés', :description
    actions
  end
end

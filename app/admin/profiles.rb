ActiveAdmin.register Profile do
  permit_params :first_name, :last_name, :phone_number, :role, :status, :gender, :party

  scope :all
  scope :captain
  scope :player
  scope :spectator
  scope :party

  action_item :accept, only: :show do
    link_to 'Accepter', accept_admin_profile_path(profile), method: :put
  end

  action_item :deny, only: :show do
    link_to 'Refuser', deny_admin_profile_path(profile), method: :put
  end

  action_item :pending, only: :show do
    link_to 'En Attente', pending_admin_profile_path(profile), method: :put
  end

  member_action :accept, method: :put do
    profile = Profile.find(params[:id])
    profile.update_attributes(status: "active")
    redirect_to admin_profile_path(profile)
  end

  member_action :deny, method: :put do
    profile = Profile.find(params[:id])
    profile.update_attributes(status: "denied")
    redirect_to admin_profile_path(profile)
  end

  member_action :pending, method: :put do
    profile = Profile.find(params[:id])
    profile.update_attributes(status: "pending")
    redirect_to admin_profile_path(profile)
  end

  index do
    selectable_column
    column :id
    column :user
    column :gender
    column :phone_number
    column :role
    column :status
    actions
  end
end

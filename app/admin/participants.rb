ActiveAdmin.register Participant do

  permit_params :team, :user, :status

  def name
    "#{Profile.find(id).first_name} #{Profile.find(id).last_name}"
  end
end

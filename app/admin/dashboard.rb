ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Équipes en attente de validation" do
          teams_awaiting = Team.pending
          ol do
            teams_awaiting.each do |team|
              li link_to(team.name, admin_team_path(team))
            end
          end
        end
      end

      column do
        panel "Équipes validées" do
          teams_validated = Team.accepted
          ol do
            teams_validated.each do |team|
              li link_to(team.name, admin_team_path(team))
            end
          end
        end
      end
    end

    columns do
      column do
        panel 'Joueurs en attente de validation' do
          players_awaiting = Participant.pending
          ol do
            players_awaiting.each do |player|
              li link_to(player.user.name, admin_participant_path(player))
            end
          end
        end
      end
      column do
        panel 'Joueur refusés' do
          players_denied = Participant.denied
          ol do
            players_denied.each do |player|
              li link_to(player.user.name, admin_participant_path(player))
            end
          end
        end
      end
    end

    columns do
      column do
        panel 'Spectateurs en attente de validation' do
          spectators_awaiting = Profile.where(role: 'spectator', status:'inactive')
          ol do
            spectators_awaiting.each do |spectator|
              li link_to(spectator.user.name, admin_profile_path(spectator))
            end
          end
        end
      end
    end
  end

    # Here is an example of a simple dashboard with columns and panels.

    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  # content
end

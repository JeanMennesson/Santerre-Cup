class CommentsController < ApplicationController
  def create
    @team = Team.find(params[:team_id])
    @comment = Comment.new(comment_params)
    @comment.team = @team
    @potential_coplayers = @team.participants.pending
    @coplayers = @team.participants.accepted
    authorize @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to team_path(@team) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'teams/show' }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

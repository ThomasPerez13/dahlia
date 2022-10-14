class TeamsController < ApplicationController
  def index
    memberships = current_user.memberships
    @teams = []
    @members = []
    memberships.each do |membership|
      @teams << membership.team
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.creator = current_user
    @team.save
    redirect_to new_team_membership_path(@team), status: :see_other
  end

  private

  def team_params
    params.require(:team).permit(:name, :number_membership)
  end
end

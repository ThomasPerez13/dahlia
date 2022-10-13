class TeamsController < ApplicationController
  def index
    memberships = current_user.memberships
    @teams =[]
    @members =[]
    memberships.each do |membership|
      @teams << membership.team
      @members << membership.user
    end
  end

  def new
    @team = Team.new
  end

  private

  def team_params
    params.require(:team).permit(:name, :number_membership)
  end
end

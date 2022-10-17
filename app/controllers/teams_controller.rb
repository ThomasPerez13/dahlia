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

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    @team.number_membership = @team.number_membership + @team.nb_member_to_add if @team.nb_member_to_add != nil
    @team.nb_member_to_add = 0
    @team.save
    if @team.number_membership + 1 == @team.memberships.count
      redirect_to teams_path, status: :see_other
    else
      redirect_to new_team_membership_path(@team), status: :see_other
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :number_membership, :area, :nb_member_to_add)
  end
end

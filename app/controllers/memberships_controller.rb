class MembershipsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @memberships = []
    member_to_add = @team.number_membership - @team.memberships.count
    member_to_add += 1 if @team.memberships.where(email: current_user.email) != []
    member_to_add.times do
      @memberships << Membership.new
    end
  end

  def create
    membership = Membership.new(membership_params)
    team = Team.find(params[:team_id])
    user = User.where(email: membership.email)
    if user == [] || team.memberships.where(email: membership.email) != []
      redirect_to new_team_membership_path(team), status: :see_other
      flash.alert = "L'utilisateur n'est pas inscrit ou il est déjà dans le groupe"
    else
      membership.team = team
      membership.user = user.first
      membership.save
      add_creator_membership if (team.number_membership == team.memberships.count) && (team.memberships.where(email: current_user.email) == [] )
      redirect_to teams_path, status: :see_other if (team.number_membership + 1 == team.memberships.count)
    end
  end

  private

  def add_creator_membership
    membership = Membership.new
    membership.email = current_user.email
    membership.team = Team.find(params[:team_id])
    membership.user = current_user
    membership.save
  end

  def membership_params
    params.require(:membership).permit(:email)
  end
end

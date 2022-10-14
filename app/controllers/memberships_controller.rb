class MembershipsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @memberships = []
    @team.number_membership.times do
      @memberships << Membership.new
    end
  end

  def create
    membership = Membership.new(membership_params)
    team = Team.find(params[:team_id])
    user = User.where(email: membership.email)
    membership.team = team
    membership.user = user.first
    membership.save
    add_creator_membership if team.number_membership == team.memberships.count
  end

  private

  def add_creator_membership
    membership = Membership.new
    membership.email = current_user.email
    membership.team = Team.find(params[:team_id])
    membership.user = current_user
    membership.save
    redirect_to teams_path, status: :see_other
  end

  def membership_params
    params.require(:membership).permit(:email)
  end
end

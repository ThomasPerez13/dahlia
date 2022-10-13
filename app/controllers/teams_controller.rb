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
end

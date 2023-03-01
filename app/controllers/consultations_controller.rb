class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.where(user: current_user)
  end

  def show
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @recurring = @consultation.recurring
    @group_path = @consultation.consultation_group ? consultation_group_path(@consultation.consultation_group) : "#"
    @frequency_message = @consultation.consultation_group.description if @consultation.consultation_group
    members_of_all_my_team
    @consultations = @patient.consultations
    @latest_consultation = @consultations.where(start_date: ...@consultation.start_date).order(:start_date).last
    if @latest_consultation == nil
      @notes_from_previous_consultations = []
    else
      @notes_from_previous_consultations = Note.where(favorite: false, creation_consultation_id: @latest_consultation.id )
    end

    @favorite_notes = Note.joins(:creation_consultation).where(favorite: true, creation_consultation: { patient_id: @patient.id })
    @final_notes = @favorite_notes + @notes_from_previous_consultations
    # line below is usefull if we want to modify the recurency of a consultation_group
    # @frequency = %w[daily weekly]
  end

  def new
    @consultation = Consultation.new
    @frequency = %w[journalière hebdomadaire]
    members_of_all_my_team
    @consultation.build_consultation_group # Create a consultation_group (nested in the "new consultation" form)
  end

  def create
    @consultation = Consultation.new(consultation_params)

    if params[:consultation][:recurring].nil?
      @consultation.recurring = false
      @consultation.user = current_user if @consultation.user.nil? # To check later
    else
      @consultation_group = ConsultationGroup.new(start_date: @consultation.start_date, end_date: params[:consultation][:consultation_groups][:end_date], frequency: params[:consultation][:consultation_groups][:frequency])
      @consultation_group.save
      @consultation.consultation_group = @consultation_group
      @consultation.user = current_user if @consultation.user.nil? # To check later
      create_recurring_consultations(@consultation, @consultation_group)
    end


    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  def update
    @consultation = Consultation.find(params[:id])
    @consultation.update(consultation_params)
    redirect_to consultation_path(@consultation)
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @consultation.destroy
    redirect_to patient_path(@patient), status: :see_other, info: "La consultation a bien été supprimée"
  end

  private

  def create_recurring_consultations(consultation, consultation_group)
    frequency = 1 if consultation_group.frequency == "journalière"
    frequency = 7 if consultation_group.frequency == "hebdomadaire"
    start_date_of_recurring_consultation = consultation_group.start_date.advance(days: "+#{frequency}".to_i)

    while Consultation.last.start_date.advance(days: "+#{frequency}".to_i).end_of_day <= consultation_group.end_date.end_of_day
      Consultation.create(
        patient: consultation.patient,
        user: consultation.user,
        duration_in_min: consultation.duration_in_min,
        recurring: consultation.recurring,
        consultation_group: consultation.consultation_group,
        start_date: start_date_of_recurring_consultation
      )
      start_date_of_recurring_consultation = start_date_of_recurring_consultation.advance(days: "+#{frequency}".to_i)
    end
  end

  def members_of_all_my_team
    teams = []
    members_of_team = []
    users_of_team = []
    current_user.memberships.each do |membership|
      teams << membership.team
    end
    teams.each do |team|
      members_of_team << team.memberships
    end
    members_of_team.each do |members|
      members.each do |member|
        users_of_team << member.user
      end
    end
    @users_of_team = users_of_team.uniq
  end

  def consultation_params
    params.require(:consultation).permit(:start_date, :patient_id, :user_id, :recurring, consultation_groups_attributes: [:end_date, :frequency])
  end
end

class ConsultationsController < ApplicationController
  def index
    # use with simple calendar form
    # today_date = params.fetch(:start_date, Date.today).to_date
    # @consultations = Consultation.where(user: current_user, start_date: today_date.beginning_of_week..today_date.end_of_week)

    # use with default display calendar (first try)
    #  params[:next_date] ||= Date.today.to_s
    #  date = Date.parse(params[:next_date])
    #  params[:current_day] ||= date
    #  @consultations = Consultation.where(user: current_user).where(start_date: params[:current_day].beginning_of_day..params[:current_day].end_of_day).order(:start_date)

    today_date = params.fetch(:start_date, Date.today).to_date
    @consultations = Consultation.where(user: current_user,
                                        start_date: today_date.beginning_of_day..today_date.end_of_day)
  end

  def show
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @consultations = @patient.consultations
    @latest_consultation = @consultations.where(start_date: ...@consultation.start_date).order(:start_date).last
    if @latest_consultation == nil
      @notes_from_previous_consultations = []
    else
      @notes_from_previous_consultations = Note.where(favorite: false, creation_consultation_id: @latest_consultation.id )
    end

    @favorite_notes = Note.joins(:creation_consultation).where(favorite: true, creation_consultation: { patient_id: @patient.id })
    @final_notes = @favorite_notes + @notes_from_previous_consultations
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  def edit
    @consultation = Consultation.find(params[:id])
  end

  def update
    @consultation = Consultation.find(params[:id])
    @consultation.update(consultation_params)
    redirect_to consultation_path(@consultation)
  end

  private

  def consultation_params
    params.require(:consultation).permit(:start_date, :patient_id, :user_id)
  end
end

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
    @consultations = Consultation.where(user: current_user, start_date: today_date.beginning_of_day..today_date.end_of_day)
    # render json: @consultations
    # raise
  end

  # data-schedules="[{"id":252,"start_date":"2022-10-24T09:00:00.000+02:00","duration_in_min":30,"
  #                    patient_id":62,"user_id":13,"created_at":"2022-10-24T19:06:00.168+02:00","
  #                    updated_at":"2022-10-24T19:06:00.168+02:00"},
  #                  {"id":253,"start_date":"2022-10-24T11:00:00.000+02:00","duration_in_min":30,"
  #                    patient_id":63,"user_id":13,"created_at":"2022-10-24T19:06:00.173+02:00","
  #                    updated_at":"2022-10-24T19:06:00.173+02:00"},
  #                  {"id":254,"start_date":"2022-10-24T14:00:00.000+02:00","duration_in_min":30,"
  #                    patient_id":64,"user_id":13,"created_at":"2022-10-24T19:06:00.176+02:00","
  #                    updated_at":"2022-10-24T19:06:00.176+02:00"},
  #                  {"id":255,"start_date":"2022-10-24T16:00:00.000+02:00","duration_in_min":30,"
  #                    patient_id":65,"user_id":13,"created_at":"2022-10-24T19:06:00.180+02:00","
  #                    updated_at":"2022-10-24T19:06:00.180+02:00"},
  #                  {"id":256,"start_date":"2022-10-24T18:00:00.000+02:00","duration_in_min":30,"
  #                    patient_id":66,"user_id":13,"created_at":"2022-10-24T19:06:00.183+02:00","
  #                    updated_at":"2022-10-24T19:06:00.183+02:00"}]"

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

class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params_note)
    @note.creation_consultation = Consultation.find(params[:consultation_id].to_i)
    @note.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to consultation_path(Consultation.find(params[:consultation_id]))
  end

  private

  def params_note
    params.require(:note).permit(:favorite, :content)
  end
end

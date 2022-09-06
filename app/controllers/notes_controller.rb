class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params_note)
    @note.creation_consultation = Consultation.find(params[:consultation_id].to_i)
    @note.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to consultations_path(Consultation.find(params[:consultation_id]))
  end

  def add_to_favorites
    @note = Note.find(params[:id])

    if @note.favorite == true
      @note.favorite = false
    else
      @note.favorite = true
    end
    @note.save
  end

  def remove_from_favorites
    @note = Note.find(params[:id])
    @note.favorite = false
    @note.save
  end

  private

  def params_note
    params.require(:note).permit(:favorite, :content)
  end
end

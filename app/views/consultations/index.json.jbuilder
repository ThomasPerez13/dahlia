# json.array! @consultations, :id, :start_date, :duration_in_min

# json.array! @patients, :id, :first_name, :last_name, :address

json.array! @consultations do |consultation|
  # next if consultation.marked_as_spam_by?(current_user)

  json.id consultation.id
  json.start_date consultation.start_date
  json.duration_in_min consultation.duration_in_min
  json.first_name consultation.patient.first_name
  json.last_name consultation.patient.last_name
  json.address consultation.patient.address
  json.treatments consultation.treatments.map(&:category)
  # json.author do
  #   json.first_name consultation.author.first_name
  #   json.last_name consultation.author.last_name
  # end
end

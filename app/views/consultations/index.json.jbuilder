json.array! @consultations do |consultation|
  json.id consultation.id
  json.start_date consultation.start_date
  json.duration_in_min consultation.duration_in_min
  json.first_name consultation.patient.first_name
  json.last_name consultation.patient.last_name
  json.address consultation.patient.address
  json.treatments consultation.treatments.map(&:category)
end

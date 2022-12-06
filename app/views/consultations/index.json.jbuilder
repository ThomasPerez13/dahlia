json.array! @consultations do |consultation|
  json.id consultation.id
  json.start_date consultation.start_date
  json.start_time consultation.start_date.strftime("%H:%M")
  json.end_date consultation.start_date + (consultation.duration_in_min * 60)
  json.end_time (consultation.start_date + (consultation.duration_in_min * 60)).strftime("%H:%M")
  json.gender consultation.patient.gender
  json.first_name consultation.patient.first_name
  json.last_name consultation.patient.last_name.upcase
  json.address consultation.patient.address
  json.array_treatments consultation.transform_treatments_in_html
  json.string_treatments consultation.display_treatments
  json.url consultation_path(consultation)
end

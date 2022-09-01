# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 3 users, 3 patients, 3 consultations, 1 notes, 1 traitement

Note.destroy_all
Treatment.destroy_all
Consultation.destroy_all
Patient.destroy_all
User.destroy_all

puts "loading users..."
isabelle = User.create!(first_name: "Isabelle", last_name: "Choyer", email: "isabelle.choyer@gmail.com", tel_number: "0638475647", password: "isabelle123")
nicolas = User.create!(first_name: "Nicolas", last_name: "Hali", email: "nicolas.hali@gmail.com", tel_number: "0628493845", password: "nicolas123")
cecile = User.create!(first_name: "Cécile", last_name: "Lagarde", email: "cecile.lagarde@gmail.com", tel_number: "0629384756", password: "cecile123")

puts "loading patients..."
#TODO / DONE / Créer 2 patients en plus jade et emma
alexandre = Patient.create!(first_name: "Alexandre", last_name: "Roux", address: "12 rue du Pilori - Nantes", email: "alexandre.belhora@gmail.com", tel_number: "0635987645", ss_number: "1 85 05 78 006 084 36",
referring_doctor: "Dr. Durand", emergency_contact_name: "Adam", emergency_contact_tel: "0642473905", birth_day: "19/11/95", height: "185", weight: "90", blood_type: "A+", referring_user: isabelle )
catherine = Patient.create!(first_name: "Catherine", last_name: "Fermier", address: "13 place Bouffay - Nantes", email: "catherine.fermier@gmail.com", tel_number: "0639874698", ss_number: "1 98 43 23 938 498 39",
  referring_doctor: "Dr. Magret", emergency_contact_name: "Vincent", emergency_contact_tel: "0638475647", birth_day: "18/01/76", height: "190", weight: "87", blood_type: "B+", referring_user: isabelle )
florent = Patient.create!(first_name: "Florent", last_name: "Boucher", address: "12 rue du Régiment d'Infanterie - Nantes", email: "florent.avocat@gmail.com", tel_number: "0638473948", ss_number: "1 98 23 11 487 438 11",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Benoit", emergency_contact_tel: "0649584756", birth_day: "02/06/98", height: "172", weight: "90", blood_type: "AB+", referring_user: isabelle )
emma = Patient.create!(first_name: "Jade", last_name: "Martin", address: "22 rue du Lieutenant de Monti - Rezé", email: "emma.martin@gmail.com", tel_number: "0639460275", ss_number: "1 12 34 59 394 221 01",
  referring_doctor: "Dr. Bonnet", emergency_contact_name: "Gabriel", emergency_contact_tel: "0649123451", birth_day: "01/01/85", height: "176", weight: "60", blood_type: "A-", referring_user: isabelle )
jade = Patient.create!(first_name: "Louise", last_name: "Lambert", address: "10 avenue de Bretagne - Rezé", email: "jade.lambert@gmail.com", tel_number: "0749563745", ss_number: "4 23 54 44 123 549 01",
  referring_doctor: "Dr. Fontaine", emergency_contact_name: "Adam", emergency_contact_tel: "0638465847", birth_day: "27/08/94", height: "182", weight: "64", blood_type: "B-", referring_user: isabelle )


# / DONE / TODO : 10 consultations pour 1 Isabelle sur la journée sur l'index. 5 patients.
puts "loading consultations..."

# Consultations de Isabelle le 12 septembre 2022
consultation1_isa = Consultation.create!(patient: alexandre, user: isabelle, start_date: "12/09/22")
consultation2_isa = Consultation.create!(patient: catherine, user: isabelle, start_date: "12/09/22")
consultation3_isa = Consultation.create!(patient: florent, user: isabelle, start_date: "12/09/22")
consultation4_isa = Consultation.create!(patient: jade, user: isabelle, start_date: "12/09/22")
consultation5_isa = Consultation.create!(patient: emma, user: isabelle, start_date: "12/09/22")
consultation6_isa = Consultation.create!(patient: alexandre, user: isabelle, start_date: "12/09/22")
consultation7_isa = Consultation.create!(patient: catherine, user: isabelle, start_date: "12/09/22")
consultation8_isa = Consultation.create!(patient: florent, user: isabelle, start_date: "12/09/22")
consultation9_isa = Consultation.create!(patient: jade, user: isabelle, start_date: "12/09/22")
consultation10_isa = Consultation.create!(patient: emma, user: isabelle, start_date: "12/09/22")

# Consultations de Nicolas
consultation_catherine = Consultation.create!(patient: catherine, user: nicolas, start_date: "01/09/22")

# Consultations dde Cécile
consultation_florent = Consultation.create!(patient: florent, user: cecile, start_date: "01/09/22")

puts "loading notes..."

note_alexandre = Note.create!(content: "Le pansement se décolle facilement, penser à bien appuyer lors de la mise en place", favorite: false, creation_consultation: consultation1_isa)
note_catherine = Note.create!(content: "Patient sensible lors des piqures, le rassurer et injecter délicatement", favorite: true, creation_consultation: consultation2_isa)
note_florent = Note.create!(content: "Lui faire penser d'appeler sa petite fille par son prénom et non par celui de sa femme", favorite: false, creation_consultation: consultation3_isa)

puts "loading treatments..."

# / DONE /TODO: Créer des traitements pour les 10 consultations d'isabelle le 12 septembre 2022
Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation1_isa)
Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: consultation1_isa)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: consultation1_isa)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: consultation2_isa)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: consultation2_isa)

Treatment.create!(category: "Médicament", done: false, content: "Lui administrer 2mg de doliprane", consultation: consultation3_isa)
Treatment.create!(category: "Diabétique", done: false, content: "Lui administrer 10mg de Glucophage", consultation: consultation3_isa)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation4_isa)
Treatment.create!(category: "Autre", done: false, content: "Poser 4 points de suture", consultation: consultation4_isa)

Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: consultation5_isa)
Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: consultation5_isa)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation6_isa)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: consultation6_isa)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: consultation7_isa)
Treatment.create!(category: "Médicament", done: false, content: "Lui administrer 2mg de doliprane", consultation: consultation7_isa)

Treatment.create!(category: "Médicament", done: false, content: "Lui administrer 2mg de doliprane", consultation: consultation8_isa)
Treatment.create!(category: "Autre", done: false, content: "Poser 4 points de suture", consultation: consultation8_isa)

Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: consultation9_isa)
Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: consultation9_isa)

Treatment.create!(category: "Injection", done: false, content: "Renouveler le pansement", consultation: consultation10_isa)
Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation10_isa)

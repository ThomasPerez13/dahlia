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
isabelle = User.create!(first_name: "Thomas", last_name: "Perez", email: "thomas.perez@gmail.com", tel_number: "0638475647", password: "thomas123")
nicolas = User.create!(first_name: "Nicolas", last_name: "Hali", email: "nicolas.hali@gmail.com", tel_number: "0628493845", password: "nicolas123")
cecile = User.create!(first_name: "Cécile", last_name: "Lagarde", email: "cecile.lagarde@gmail.com", tel_number: "0629384756", password: "cecile123")

puts "loading patients..."
alexandre = Patient.create!(first_name: "Alexandre", last_name: "Roux", address: "12 rue du Pilori, Nantes", email: "alexandre.belhora@gmail.com", tel_number: "0635987645", ss_number: "195114400608436",
  referring_doctor: "Dr. Durand", emergency_contact_name: "Adam Boulier", emergency_contact_tel: "0642473905", birth_day: "19/11/1995", height: "185", weight: "90", blood_type: "A+", referring_user: isabelle ,gender: "Homme")
catherine = Patient.create!(first_name: "Catherine", last_name: "Fermier", address: "13 place Bouffay, Nantes", email: "catherine.fermier@gmail.com", tel_number: "0639874698", ss_number: "276014493849839",
  referring_doctor: "Dr. Magret", emergency_contact_name: "Vincent Ducrot", emergency_contact_tel: "0638475647", birth_day: "18/01/1976", height: "190", weight: "87", blood_type: "B+", referring_user: isabelle, gender: "Femme")
florent = Patient.create!(first_name: "Florent", last_name: "Boucher", address: "12 rue du Régiment d'Infanterie, Nantes", email: "florent.avocat@gmail.com", tel_number: "0638473948", ss_number: "198064448743811",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Benoit Boulay", emergency_contact_tel: "0649584756", birth_day: "02/06/1998", height: "172", weight: "90", blood_type: "AB+", referring_user: isabelle, gender: "Homme")
emma = Patient.create!(first_name: "Jade", last_name: "Martin", address: "22 rue du Lieutenant de Monti, Rezé", email: "emma.martin@gmail.com", tel_number: "0639460275", ss_number: "285014439422101",
  referring_doctor: "Dr. Bonnet", emergency_contact_name: "Gabriel Boulay", emergency_contact_tel: "0649123451", birth_day: "01/01/1985", height: "176", weight: "60", blood_type: "A-", referring_user: isabelle, gender: "Femme")
louise = Patient.create!(first_name: "Louise", last_name: "Lambert", address: "10 avenue de Bretagne, Rezé", email: "louise.lambert@gmail.com", tel_number: "0749563745", ss_number: "208944412354901",
  referring_doctor: "Dr. Fontaine", emergency_contact_name: "Aude Margaux", emergency_contact_tel: "0638465847", birth_day: "27/08/1994", height: "182", weight: "64", blood_type: "B-", referring_user: isabelle, gender: "Femme")
simone_beauchamp = Patient.create!(first_name: "Simone", last_name: "Beauchamp", address: "20 Bd Saint-Aignan, Nantes", email: "simonebeauchamp@jourrapide.com", tel_number: "0798374745", ss_number: "251014412354901",
    referring_doctor: "Dr. Dupont", emergency_contact_name: "Laurent Cochet", emergency_contact_tel: "0638465847", birth_day: "10/01/1951", height: "152", weight: "64", blood_type: "B-", referring_user: isabelle, gender: "Femme")
armand_goulin = Patient.create!(first_name: "Armand", last_name: "Gaulin", address: "2 rue du Roi Albert, Nantes", email: "ArmandGaulin@gmail.com", tel_number: "0698374745", ss_number: "174121507816013",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Jean Moulin", emergency_contact_tel: "0638465847", birth_day: "08/12/1975", height: "172", weight: "64", blood_type: "O+", referring_user: isabelle, gender: "Homme")
peppin_riquier = Patient.create!(first_name: "Peppin", last_name: "Riquier", address: "6 rue Talensac, Nantes", email: "peppin.riri@gmail.com", tel_number: "0698473745", ss_number: "157097867687437",
  referring_doctor: "Dr. Fontaine", emergency_contact_name: "Maurice Louis", emergency_contact_tel: "0285236859", birth_day: "01/09/1957", height: "176", weight: "107.3", blood_type: "B+", referring_user: isabelle, gender: "Homme")
joseph_blanc = Patient.create!(first_name: "Joseph", last_name: "Blanc", address: "58 rue Jean Emile Laboureur, Nantes", email: "josephblanc@gmail.com", tel_number: "0738473745", ss_number: "197035050159412",
  referring_doctor: "Dr. Bonnet", emergency_contact_name: "Aude Margaux", emergency_contact_tel: "0785236859", birth_day: "05/03/1997", height: "167", weight: "93.5", blood_type: "AB+", referring_user: isabelle, gender: "Homme")
clementine_racine = Patient.create!(first_name: "Clementine", last_name: "Racine", address: "1 Rue Eugène Tessier, Nantes", email: "ClementineRacine@gmail.com", tel_number: "0684930275", ss_number: "283039876382667",
  referring_doctor: "Dr. Fontaine", emergency_contact_name: "Raphaël Hamou", emergency_contact_tel: "0642473905", birth_day: "05/03/1983", height: "167", weight: "63.5", blood_type: "O+", referring_user: isabelle, gender: "Femme")
zdenek_rousseau = Patient.create!(first_name: "Zdenek", last_name: "Rousseau", address: "28 rue Gustave Eiffel, Rezé", email: "ZdenekRousseau@free.com", tel_number: "0236465638", ss_number: "199013974802623",
  referring_doctor: "Dr. Fontaine", emergency_contact_name: "Raphaël Hamou", emergency_contact_tel: "0642473905", birth_day: "01/10/1999", height: "185", weight: "89.4", blood_type: "O+", referring_user: isabelle, gender: "Homme")
bellamy_petit = Patient.create!(first_name: "Bellamy", last_name: "Petit", address: "57 Chemin Des Bateliers, Nantes", email: "bellamy_petit@free.com", tel_number: "0251490202", ss_number: "160023252385254",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Raphaël Hamou", emergency_contact_tel: "0642473905", birth_day: "09/11/1960", height: "165", weight: "72.6", blood_type: "A-", referring_user: isabelle, gender: "Homme")
aubrey_henrichon = Patient.create!(first_name: "Aubrey", last_name: "Henrichon", address: "61 place Stanislas, Nantes", email: "aubrey_henrichon@gmail.com", tel_number: "0232501951", ss_number: "246070775714709",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Louis Cohen", emergency_contact_tel: "0232501951", birth_day: "13/07/1946", height: "172", weight: "97.0", blood_type: "O+", referring_user: isabelle, gender: "Femme")
ancelina_charpentier = Patient.create!(first_name: "Ancelina", last_name: "Charpentier", address: "12 rue des six frères Ruellan, Saint-Sébastien-sur-Loire", email: "ancelina_charpentier@gmail.com", tel_number: "0639460275", ss_number: "246070775714743",
  referring_doctor: "Dr. Herver", emergency_contact_name: "Louis Defline", emergency_contact_tel: "0638465847", birth_day: "13/07/1946", height: "168", weight: "91.9", blood_type: "O-", referring_user: isabelle, gender: "Femme")
ginette_retif = Patient.create!(first_name: "Ginette", last_name: "Retif", address: "43 rue Talensac, Nantes", email: "ginette_retif@gmail.com", tel_number: "0270065078", ss_number: "236114822985608",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Louis Cohen", emergency_contact_tel: "0232501951", birth_day: "09/11/1936", height: "172", weight: "97.0", blood_type: "O+", referring_user: isabelle, gender: "Femme")
coralie_monjeau = Patient.create!(first_name: "Coralie", last_name: "Monjeau", address: "23 rue du Président Roosevelt, Nantes", email: "coralie_monjeau@gmail.com", tel_number: "02398478151", ss_number: "236114822985612",
  referring_doctor: "Dr. Lefebvre", emergency_contact_name: "Henry Bertheau", emergency_contact_tel: "0232501951", birth_day: "09/11/1936", height: "172", weight: "97.0", blood_type: "O+", referring_user: isabelle, gender: "Femme")


  # / DONE / TODO : 10 consultations pour 1 Isabelle sur la journée sur l'index. 5 patients.
puts "loading consultations..."

# Consultations de Isabelle le 12 septembre 2022
consultation1_isa = Consultation.create!(patient: alexandre, user: isabelle, start_date: DateTime.parse("22/09/09 07:00 +0200"))
consultation2_isa = Consultation.create!(patient: catherine, user: isabelle, start_date: DateTime.parse("22/09/09 07:30 +0200"))
consultation3_isa = Consultation.create!(patient: florent, user: isabelle, start_date: DateTime.parse("22/09/09 08:00 +0200"))
consultation4_isa = Consultation.create!(patient: louise, user: isabelle, start_date: DateTime.parse("22/09/09 08:30 +0200"))
consultation6_isa = Consultation.create!(patient: louise, user: isabelle, start_date: DateTime.parse("22/09/09 09:30 +0200"))
consultation7_isa = Consultation.create!(patient: catherine, user: isabelle, start_date: DateTime.parse("22/09/09 10:00 +0200"))
consultation8_isa = Consultation.create!(patient: florent, user: isabelle, start_date: DateTime.parse("22/09/09 10:30 +0200"))
consultation9_isa = Consultation.create!(patient: louise, user: isabelle, start_date: DateTime.parse("22/09/09 11:00 +0200"))
consultation10_isa = Consultation.create!(patient: zdenek_rousseau, user: isabelle, start_date: DateTime.parse("22/09/09 11:30 +0200"))
consultation11_isa = Consultation.create!(patient: alexandre, user: isabelle, start_date: DateTime.parse("22/09/10 07:00 +0200"))
consultation12_isa = Consultation.create!(patient: catherine, user: isabelle, start_date: DateTime.parse("22/09/10 07:30 +0200"))
consultation13_isa = Consultation.create!(patient: florent, user: isabelle, start_date: DateTime.parse("22/09/10 08:00 +0200"))
consultation14_isa = Consultation.create!(patient: louise, user: isabelle, start_date: DateTime.parse("22/09/10 08:30 +0200"))
consultation15_isa = Consultation.create!(patient: zdenek_rousseau, user: isabelle, start_date: DateTime.parse("22/09/10 09:00 +0200"))
consultation16_isa = Consultation.create!(patient: alexandre, user: isabelle, start_date: DateTime.parse("22/09/10 09:30 +0200"))
consultation17_isa = Consultation.create!(patient: catherine, user: isabelle, start_date: DateTime.parse("22/09/10 10:00 +0200"))
consultation18_isa = Consultation.create!(patient: florent, user: isabelle, start_date: DateTime.parse("22/09/10 10:30 +0200"))
consultation19_isa = Consultation.create!(patient: louise, user: isabelle, start_date: DateTime.parse("22/09/10 11:00 +0200"))
consultation01_isa = Consultation.create!(patient: alexandre, user: isabelle, start_date: DateTime.parse("22/09/08 07:00 +0200"))
consultation20_isa = Consultation.create!(patient: zdenek_rousseau, user: isabelle, start_date: DateTime.parse("22/09/11 11:30 +0200"))

consultation01_tho = Consultation.create!(patient: zdenek_rousseau, user: isabelle, start_date: DateTime.parse("22/09/05 11:30 +0200"))
consultation02_tho= Consultation.create!(patient: zdenek_rousseau, user: isabelle, start_date: DateTime.parse("22/09/01 11:30 +0200"))
consultation03_tho= Consultation.create!(patient: zdenek_rousseau, user: isabelle, start_date: DateTime.parse("22/08/28 11:30 +0200"))
consultation04_tho= Consultation.create!(patient: zdenek_rousseau, user: isabelle, start_date: DateTime.parse("22/08/23 11:30 +0200"))

# Consultations de Nicolas
consultation_catherine = Consultation.create!(patient: catherine, user: nicolas, start_date: "01/09/22")

# Consultations dde Cécile
consultation_florent = Consultation.create!(patient: florent, user: cecile, start_date: "01/09/22")

puts "loading notes..."


note_catherine = Note.create!(content: "Patient sensible lors des piqures, le rassurer et injecter délicatement", favorite: true, creation_consultation: consultation1_isa)
note_alexandre = Note.create!(content: "Demander au médecin référent une ordonnance pour médicaments", favorite: false, creation_consultation: consultation01_isa)
note_florent = Note.create!(content: "Lui faire penser d'appeler sa petite fille par son prénom et non par celui de sa femme", favorite: false, creation_consultation: consultation3_isa)
note_rousseau = Note.create!(content: "Attention chien méchant, attendre au portail", favorite: true, creation_consultation: consultation01_tho)
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

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation11_isa)
Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: consultation11_isa)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: consultation11_isa)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: consultation12_isa)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: consultation12_isa)

Treatment.create!(category: "Médicament", done: false, content: "Lui administrer 2mg de doliprane", consultation: consultation13_isa)
Treatment.create!(category: "Diabétique", done: false, content: "Lui administrer 10mg de Glucophage", consultation: consultation13_isa)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation14_isa)
Treatment.create!(category: "Autre", done: false, content: "Poser 4 points de suture", consultation: consultation14_isa)

Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: consultation15_isa)
Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: consultation15_isa)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation16_isa)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: consultation16_isa)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: consultation17_isa)
Treatment.create!(category: "Médicament", done: false, content: "Lui administrer 2mg de doliprane", consultation: consultation17_isa)

Treatment.create!(category: "Médicament", done: false, content: "Lui administrer 2mg de doliprane", consultation: consultation18_isa)
Treatment.create!(category: "Autre", done: false, content: "Poser 4 points de suture", consultation: consultation18_isa)

Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: consultation19_isa)
Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: consultation19_isa)

Treatment.create!(category: "Injection", done: false, content: "Renouveler le pansement", consultation: consultation20_isa)
Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation20_isa)


Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: consultation01_tho)
Treatment.create!(category: "Médicament", done: false, content: "Lui administrer 2mg de doliprane", consultation: consultation01_tho)

Treatment.create!(category: "Médicament", done: false, content: "Lui administrer 2mg de doliprane", consultation: consultation02_tho)
Treatment.create!(category: "Autre", done: false, content: "Poser 4 points de suture", consultation: consultation02_tho)

Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: consultation03_tho)
Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: consultation03_tho)

Treatment.create!(category: "Injection", done: false, content: "Renouveler le pansement", consultation: consultation04_tho)
Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: consultation04_tho)

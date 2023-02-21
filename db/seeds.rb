puts "destroy existing consultations..."
Consultation.destroy_all

puts "destroy existing patients..."
Patient.destroy_all

puts "destroy existing Memberships..."
Membership.destroy_all

puts "destroy existing teams..."
Team.destroy_all

puts "destroy existing user..."
User.destroy_all

puts "loading users..."
thomas = User.create!(first_name: "Thomas", last_name: "Perez", email: "thomas.perez@gmail.com", tel_number: "0638475647", password: "thomas123")
nicolas = User.create!(first_name: "Nicolas", last_name: "Hali", email: "nicolas.hali@gmail.com", tel_number: "0628493845", password: "nicolas123")
cecile = User.create!(first_name: "Cécile", last_name: "Lagarde", email: "cecile.lagarde@gmail.com", tel_number: "0629384756", password: "cecile123")

puts "loading teams..."
firstteam = Team.create(name: "DOM-TOM", creator: thomas, number_membership: 3, area: "La réunion")

puts "loading memberships..."
Membership.create(user: thomas, team: firstteam, email: "thomas.perez@gmail.com")
Membership.create(user: nicolas, team: firstteam, email: "nicolas.hali@gmail.com")
Membership.create(user: cecile, team: firstteam, email: "cecile.lagarde@gmail.com")


puts "loading patients..."
# PATIENTS
# Patients de Thomas
alexandre = Patient.create!(first_name: "Alexandre", last_name: "Roux", address: "12 rue du Pilori, Nantes", email: "alexandre.belhora@gmail.com", tel_number: "0635987645", ss_number: "195114400608436",
  referring_doctor: "Dr. Durand", emergency_contact_name: "Adam Boulier", emergency_contact_tel: "0642473905", birth_day: "19/11/1995", height: "185", weight: "90", blood_type: "A+", referring_user: thomas ,gender: "Homme")
joseph = Patient.create!(first_name: "Joseph", last_name: "Blanc", address: "58 rue Jean Emile Laboureur, Nantes", email: "josephblanc@gmail.com", tel_number: "0738473745", ss_number: "197035050159412",
    referring_doctor: "Dr. Bonnet", emergency_contact_name: "Aude Margaux", emergency_contact_tel: "0785236859", birth_day: "05/03/1997", height: "167", weight: "93.5", blood_type: "AB+", referring_user: thomas, gender: "Homme")
catherine = Patient.create!(first_name: "Catherine", last_name: "Fermier", address: "13 place Bouffay, Nantes", email: "catherine.fermier@gmail.com", tel_number: "0639874698", ss_number: "276014493849839",
  referring_doctor: "Dr. Magret", emergency_contact_name: "Vincent Ducrot", emergency_contact_tel: "0638475647", birth_day: "18/01/1976", height: "190", weight: "87", blood_type: "B+", referring_user: thomas, gender: "Femme")
florent = Patient.create!(first_name: "Florent", last_name: "Boucher", address: "12 rue du Régiment d'Infanterie, Nantes", email: "florent.avocat@gmail.com", tel_number: "0638473948", ss_number: "198064448743811",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Benoit Boulay", emergency_contact_tel: "0649584756", birth_day: "02/06/1998", height: "172", weight: "90", blood_type: "AB+", referring_user: thomas, gender: "Homme")
jade = Patient.create!(first_name: "Jade", last_name: "Martin", address: "22 rue du Lieutenant de Monti, Rezé", email: "jade.martin@gmail.com", tel_number: "0639460275", ss_number: "285014439422101",
  referring_doctor: "Dr. Bonnet", emergency_contact_name: "Gabriel Boulay", emergency_contact_tel: "0649123451", birth_day: "01/01/1985", height: "176", weight: "60", blood_type: "A-", referring_user: thomas, gender: "Femme")


# Patients de Nicolas
simone = Patient.create!(first_name: "Simone", last_name: "Beauchamp", address: "20 Bd Saint-Aignan, Nantes", email: "simonebeauchamp@jourrapide.com", tel_number: "0798374745", ss_number: "251014412354901",
    referring_doctor: "Dr. Dupont", emergency_contact_name: "Laurent Cochet", emergency_contact_tel: "0638465847", birth_day: "10/01/1951", height: "152", weight: "64", blood_type: "B-", referring_user: nicolas, gender: "Femme")
armand = Patient.create!(first_name: "Armand", last_name: "Gaulin", address: "2 rue du Roi Albert, Nantes", email: "ArmandGaulin@gmail.com", tel_number: "0698374745", ss_number: "174121507816013",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Jean Moulin", emergency_contact_tel: "0638465847", birth_day: "08/12/1975", height: "172", weight: "64", blood_type: "O+", referring_user: nicolas, gender: "Homme")
peppin = Patient.create!(first_name: "Peppin", last_name: "Riquier", address: "6 rue Talensac, Nantes", email: "peppin.riri@gmail.com", tel_number: "0698473745", ss_number: "157097867687437",
  referring_doctor: "Dr. Fontaine", emergency_contact_name: "Maurice Louis", emergency_contact_tel: "0285236859", birth_day: "01/09/1957", height: "176", weight: "107.3", blood_type: "B+", referring_user: nicolas, gender: "Homme")
louise = Patient.create!(first_name: "Louise", last_name: "Lambert", address: "10 avenue de Bretagne, Rezé", email: "louise.lambert@gmail.com", tel_number: "0749563745", ss_number: "208944412354901",
    referring_doctor: "Dr. Fontaine", emergency_contact_name: "Aude Margaux", emergency_contact_tel: "0638465847", birth_day: "27/08/1994", height: "182", weight: "64", blood_type: "B-", referring_user: nicolas, gender: "Femme")
clementine = Patient.create!(first_name: "Clementine", last_name: "Racine", address: "1 Rue Eugène Tessier, Nantes", email: "ClementineRacine@gmail.com", tel_number: "0684930275", ss_number: "283039876382667",
  referring_doctor: "Dr. Fontaine", emergency_contact_name: "Raphaël Hamou", emergency_contact_tel: "0642473905", birth_day: "05/03/1983", height: "167", weight: "63.5", blood_type: "O+", referring_user: nicolas, gender: "Femme")

# Patients de Cécile
zdenek = Patient.create!(first_name: "Zdenek", last_name: "Rousseau", address: "28 rue Gustave Eiffel, Rezé", email: "ZdenekRousseau@free.com", tel_number: "0236465638", ss_number: "199013974802623",
  referring_doctor: "Dr. Fontaine", emergency_contact_name: "Raphaël Hamou", emergency_contact_tel: "0642473905", birth_day: "01/10/1999", height: "185", weight: "89.4", blood_type: "O+", referring_user: cecile, gender: "Homme")
bellamy = Patient.create!(first_name: "Bellamy", last_name: "Petit", address: "57 Chemin Des Bateliers, Nantes", email: "bellamy_petit@free.com", tel_number: "0251490202", ss_number: "160023252385254",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Raphaël Hamou", emergency_contact_tel: "0642473905", birth_day: "09/11/1960", height: "165", weight: "72.6", blood_type: "A-", referring_user: cecile, gender: "Homme")
aubrey = Patient.create!(first_name: "Aubrey", last_name: "Henrichon", address: "61 place Stanislas, Nantes", email: "aubrey_henrichon@gmail.com", tel_number: "0232501951", ss_number: "246070775714709",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Louis Cohen", emergency_contact_tel: "0232501951", birth_day: "13/07/1946", height: "172", weight: "97.0", blood_type: "O+", referring_user: cecile, gender: "Homme")
ancelina = Patient.create!(first_name: "Ancelina", last_name: "Charpentier", address: "12 rue des six frères Ruellan, Saint-Sébastien-sur-Loire", email: "ancelina_charpentier@gmail.com", tel_number: "0639460275", ss_number: "246070775714743",
  referring_doctor: "Dr. Herver", emergency_contact_name: "Louis Defline", emergency_contact_tel: "0638465847", birth_day: "13/07/1946", height: "168", weight: "91.9", blood_type: "O-", referring_user: cecile, gender: "Femme")
ginette = Patient.create!(first_name: "Ginette", last_name: "Retif", address: "43 rue Talensac, Nantes", email: "ginette_retif@gmail.com", tel_number: "0270065078", ss_number: "236114822985608",
  referring_doctor: "Dr. Dupont", emergency_contact_name: "Louis Cohen", emergency_contact_tel: "0232501951", birth_day: "09/11/1936", height: "172", weight: "97.0", blood_type: "O+", referring_user: cecile, gender: "Femme")


puts "loading consultations..."

# CONSULTATIONS

def create_recurring_consultations(patient, consultation, frequency)
  recurrence_consultation = ConsultationGroup.create!(start_date: consultation.start_date, end_date: consultation.start_date.next_month.next_month.next_month, frequency: frequency)
  consultation.recurring = true
  consultation.consultation_group = recurrence_consultation

  frequency = 1 if recurrence_consultation.frequency == "daily"
  frequency = 7 if recurrence_consultation.frequency == "weekly"
  frequency = 14 if recurrence_consultation.frequency == "two weeks"
  start_date_of_recurring_consultation = recurrence_consultation.start_date.advance(days: "+#{frequency}".to_i)

  while patient.consultations.last.start_date.advance(days: "+#{frequency}".to_i).end_of_day <= recurrence_consultation.end_date.end_of_day
    Consultation.create!(
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

# Consultations passées (patient Alexandre, infirmier Thomas uniquement)
cons_thomas_alexandre_past1 = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.prev_day} 07:00 +0100"))
cons_thomas_alexandre_past2 = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.prev_day.prev_day} 09:00 +0100"))
cons_thomas_alexandre_past3 = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.prev_day.prev_day.prev_day} 09:00 +0100"))

# Create daily consultation for Thomas'patient

# Create Alexandre's consultation
puts "loading daily morning consultation for Alexandre..."

cons_thomas_alexandre_today_morn = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today} 07:00 +0100"))
create_recurring_consultations(alexandre, cons_thomas_alexandre_today_morn, "daily")

puts "loading daily afternoon consultation for Alexandre..."

cons_thomas_alexandre_today_aft = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today} 18:30:00 +0100"))
create_recurring_consultations(alexandre, cons_thomas_alexandre_today_aft, "daily")
puts "loading treatments and notes for Alexandre..."

Treatment.create!(category: "DIABETE", done: true, content: "Mesure de la glycémie", consultation: cons_thomas_alexandre_past1)

alexandre.consultations.each do |consultation|
  Treatment.create!(category: "DIABETE", done: false, content: "Mesure de la glycémie", consultation: consultation)
  Treatment.create!(category: "DIABETE", done: false, content: "Injection d'insuline", consultation: consultation)
  Note.create!(content: "Demander au médecin référent une ordonnance pour médicaments", favorite: false, creation_consultation: consultation)
end

# Create catherine's consultation
puts "loading daily morning consultation for Catherine..."

cons_thomas_catherine_today_morn = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today} 10:00 +0100"))
create_recurring_consultations(catherine, cons_thomas_catherine_today_morn, "daily")

puts "loading daily afternoon consultation for Catherine..."

cons_thomas_catherine_today_aft = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today} 14:30 +0100"))
create_recurring_consultations(catherine, cons_thomas_catherine_today_aft, "daily")

puts "loading treatments and notes for Catherine..."

catherine.consultations.each do |consultation|
  Treatment.create!(category: "HYGIENE", done: false, content: "Aide à la douche", consultation: consultation)
  Note.create!(content: "Patient sensible lors des piqures, rassurer et injecter délicatement", favorite: false, creation_consultation: consultation)
end

# Create Florent's consultation
puts "loading daily morning consultation for Florent..."

cons_thomas_florent_today_morn = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today} 11:00 +0100"))
create_recurring_consultations(florent, cons_thomas_florent_today_morn, "daily")

puts "loading daily afternoon consultation for Florent..."

cons_thomas_florent_today_aft = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today} 16:00 +0100"))
create_recurring_consultations(florent, cons_thomas_florent_today_aft, "daily")

puts "loading treatments and notes for Florent..."

florent.consultations.each do |consultation|
  Treatment.create!(category: "AUTRE", done: false, content: "Sondage urinaire", consultation: consultation)
  Treatment.create!(category: "HYGIENE", done: false, content: "Toilette complète au lit", consultation: consultation)
  Treatment.create!(category: "PANSEMENT", done: false, content: "Pansement d’escarre", consultation: consultation)
  Note.create!(content: "Lui faire penser d'appeler sa petite fille par son prénom et non par celui de sa femme", favorite: false, creation_consultation: consultation)
end

# Create Jade's consultation
puts "loading daily morning consultation for Jade..."

cons_thomas_jade_today_morn = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today} 13:00 +0100"))
create_recurring_consultations(jade, cons_thomas_jade_today_morn, "daily")

puts "loading daily afternoon consultation for Jade..."

cons_thomas_jade_today_aft = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today} 20:00 +0100"))
create_recurring_consultations(jade, cons_thomas_jade_today_aft, "daily")

puts "loading treatments and notes for Jade..."

jade.consultations.each do |consultation|
  Treatment.create!(category: "AUTRE", done: false, content: "Ablation de points", consultation: consultation)
  Note.create!(content: "Rassurer la patiente pendant la suture", favorite: false, creation_consultation: consultation)
end

# Create Joseph's consultation

puts "loading consultation every other monday during three month at 08:30 for Joseph..."

cons_thomas_joseph_mon_morn = Consultation.create!(patient: joseph, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 08:30 +0100"))
create_recurring_consultations(joseph, cons_thomas_joseph_mon_morn, "two weeks")

puts "loading treatments and notes for joseph..."

joseph.consultations.each do |consultation|
  Treatment.create!(category: "INJECTION", done: false, content: "sous cutanée (EPO)", consultation: consultation)
  Note.create!(content: "Attention chien méchant, attendre au portail", favorite: false, creation_consultation: consultation)
end

def weekly_consultations(patient, user, start_time)
  week_days = %i[ monday tuesday wednesday thursday friday ]
  week_days.each do |week_day|
    Consultation.create!(patient: patient, user: user, start_date: DateTime.parse("#{Date.today.next_occurring(week_day).strftime} #{start_time} +0100"))
  end
end


# CONSULTATIONS DE NICOLAS

# simone
puts "loading simone's consultations"
weekly_consultations(simone, nicolas, "07:00")

# armand
puts "loading armand's consultations"
weekly_consultations(armand, nicolas, "08:30")
weekly_consultations(armand, nicolas, "17:30")

# peppin
puts "loading peppin's consultations"
weekly_consultations(peppin, nicolas, "11:00")
weekly_consultations(peppin, nicolas, "19:00")

# louise
puts "loading louise's consultations"
weekly_consultations(louise, nicolas, "14:00")

# clementine
puts "loading clementine's consultations"
weekly_consultations(clementine, nicolas, "16:00")

# CONSULTATIONS DE CECILE
# zdenek
puts "loading zdenek's consultations"
weekly_consultations(zdenek, cecile, "07:00")

# bellamy
puts "loading bellamy's consultations"
weekly_consultations(bellamy, cecile, "08:30")
weekly_consultations(bellamy, cecile, "19:30")

# aubrey
puts "loading aubrey's consultations"
weekly_consultations(aubrey, cecile, "11:00")
weekly_consultations(aubrey, cecile, "20:00")

# ancelina
puts "loading ancelina's consultations"
weekly_consultations(ancelina, cecile, "15:00")
weekly_consultations(ancelina, cecile, "21:00")

# ginette
puts "loading ginette's consultations"
weekly_consultations(ginette, cecile, "18:00")

# TRAITEMENTS AND NOTES

puts "loading treatments and notes..."

# Nicolas > Simone
puts "loading treatments and notes for Simone..."

simone.consultations.each do |consultation|
  Treatment.create!(category: "PANSEMENT", done: false, content: "Renouveler le pansement", consultation: consultation)
  Note.create!(content: "Demander au médecin référent une ordonnance pour médicaments", favorite: false, creation_consultation: consultation)
end

# Cécile > Zdenek
puts "loading treatments and notes for Zdenek..."

zdenek.consultations.each do |consultation|
  Treatment.create!(category: "PANSEMENT", done: false, content: "Renouveler le pansement", consultation: consultation)
  Treatment.create!(category: "HYGIENE", done: false, content: "Nettoyer la plaie", consultation: consultation)
  Treatment.create!(category: "MEDICAMENT", done: false, content: "Administrer 2mg de doliprane", consultation: consultation)
  Note.create!(content: "Demander au médecin référent une ordonnance pour médicaments", favorite: false, creation_consultation: consultation)
end

# Nicolas > Armand
puts "loading treatments and notes for Armand..."

armand.consultations.each do |consultation|
  Treatment.create!(category: "PERFUSION", done: false, content: "Poser la perfusion", consultation: consultation)
  Treatment.create!(category: "INJECTION", done: false, content: "Injecter 12 mg d'insuline", consultation: consultation)
  Note.create!(content: "Patient sensible lors des piqures, rassurer et injecter délicatement", favorite: false, creation_consultation: consultation)
end

# Cécile > Bellamy
puts "loading treatments and notes for Bellamy..."

bellamy.consultations.each do |consultation|
  Treatment.create!(category: "AUTRE", done: false, content: "Pose alimentation parentéral", consultation: consultation)
  Treatment.create!(category: "HYGIENE", done: false, content: "aide à la douche", consultation: consultation)
  Note.create!(content: "Patient sensible lors des piqures, rassurer et injecter délicatement", favorite: false, creation_consultation: consultation)
end

# Nicolas > Peppin
puts "loading treatments and notes for Peppin..."

peppin.consultations.each do |consultation|
  Treatment.create!(category: "PRELEVEMENT", done: false, content: "Prélever 5ml de sang", consultation: consultation)
  Treatment.create!(category: "DIABETE", done: false, content: "Administrer 10mg de Glucophage", consultation: consultation)
  Note.create!(content: "Lui faire penser d'appeler sa petite fille par son prénom et non par celui de sa femme", favorite: false, creation_consultation: consultation)
end

# Cécile > Aubrey
puts "loading treatments and notes for Aubrey..."

aubrey.consultations.each do |consultation|
  Treatment.create!(category: "PRELEVEMENT", done: false, content: "Prélever 5ml de sang", consultation: consultation)
  Treatment.create!(category: "DIABETE", done: false, content: "Administrer 10mg de Glucophage", consultation: consultation)
  Note.create!(content: "Lui faire penser d'appeler sa petite fille par son prénom et non par celui de sa femme", favorite: false, creation_consultation: consultation)
end

# Nicolas > Louise
puts "loading treatments and notes for Louise..."

louise.consultations.each do |consultation|
  Treatment.create!(category: "AUTRE", done: false, content: "Surveillance des constantes", consultation: consultation)
  Note.create!(content: "Attention chien méchant, attendre au portail", favorite: false, creation_consultation: consultation)
end

# Cécile > Ancelina
puts "loading treatments and notes for Ancelina..."

ancelina.consultations.each do |consultation|
  Treatment.create!(category: "PRELEVEMENT", done: false, content: "Prélever 5ml de sang", consultation: consultation)
  Note.create!(content: "Attention chien méchant, attendre au portail", favorite: false, creation_consultation: consultation)
end

# Nicolas > Clémentine
puts "loading treatments and notes for Clémentine..."

clementine.consultations.each do |consultation|
  Treatment.create!(category: "PERFUSION", done: false, content: "hydratation sous cutanée", consultation: consultation)
  Note.create!(content: "Rassurer la patiente pendant la suture", favorite: false, creation_consultation: consultation)
end

# Cécile > Ginette
puts "loading treatments and notes for Ginette..."

ginette.consultations.each do |consultation|
  Treatment.create!(category: "PRELEVEMENT", done: false, content: "Prélèvement sanguin", consultation: consultation)
  Note.create!(content: "Rassurer la patiente pendant la suture", favorite: false, creation_consultation: consultation)
end

puts "End of seeds!"

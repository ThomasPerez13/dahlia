Note.destroy_all
Treatment.destroy_all
Consultation.destroy_all
Patient.destroy_all
Membership.destroy_all
Team.destroy_all
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

# Consultations passées (patient Alexandre, infirmier Thomas uniquement)
cons_thomas_alexandre_past1 = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.prev_day} 07:00 +0100"))
cons_thomas_alexandre_past2 = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.prev_day.prev_day} 09:00 +0100"))
cons_thomas_alexandre_past3 = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.prev_day.prev_day.prev_day} 09:00 +0100"))


# CONSULTATIONS DE THOMAS
# consultation du jour
cons_thomas_alexandre_today = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today} 07:00 +0100"))
cons_thomas_joseph_today = Consultation.create!(patient: joseph, user: thomas, start_date: DateTime.parse("#{Date.today} 08:30 +0100"))
cons_thomas_catherine_today = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today} 10:00 +0100"))
cons_thomas_florent_today = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today} 11:00 +0100"))
cons_thomas_jade_today = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today} 13:00 +0100"))
cons_thomas_catherine_today_aft = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today} 14:30 +0100"))
cons_thomas_florent_today_aft = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today} 16:00 +0100"))
cons_thomas_alexandre_today_aft = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today} 18:30:00 +0100"))
cons_thomas_jade_today_aft = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today} 20:00 +0100"))

# Consultations du lundi

cons_thomas_alexandre_mon = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 07:00 +0100"))
cons_thomas_joseph_mon = Consultation.create!(patient: joseph, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 08:30 +0100"))
cons_thomas_catherine_mon = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 10:00 +0100"))
cons_thomas_florent_mon = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 11:00 +0100"))
cons_thomas_jade_mon = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 13:00 +0100"))
cons_thomas_catherine_mon_aft = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 14:30 +0100"))
cons_thomas_florent_mon_aft = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 16:00 +0100"))
cons_thomas_alexandre_mon_aft = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 18:30:00 +0100"))

puts "loading consultation each monday during one month at 08:30 for Joseph..."

# add recuring consultation for Joseph
recurrence_joseph_consultation = ConsultationGroup.create!(start_date: cons_thomas_joseph_mon.start_date, end_date: cons_thomas_joseph_mon.start_date.next_month, frequency: "weekly")
cons_thomas_joseph_mon.recurring = true
cons_thomas_joseph_mon.consultation_group = recurrence_joseph_consultation


def create_recurring_consultations(consultation, consultation_group)
  frequency = 7 if consultation_group.frequency == "weekly"
  start_date_of_recurring_consultation = consultation_group.start_date.advance(days: "+#{frequency}".to_i)

  while Consultation.last.start_date.advance(days: "+#{frequency}".to_i).end_of_day <= consultation_group.end_date.end_of_day
    Consultation.create(
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

create_recurring_consultations(cons_thomas_joseph_mon, recurrence_joseph_consultation)

# Consultations du mardi
cons_thomas_alexandre_tue = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 07:00 +0100"))
cons_thomas_joseph_tue = Consultation.create!(patient: joseph, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 08:30 +0100"))
cons_thomas_catherine_tue = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 10:00 +0100"))
cons_thomas_florent_tue = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 11:00 +0100"))
cons_thomas_jade_tue = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 13:00 +0100"))
cons_thomas_catherine_tue_aft = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 14:30 +0100"))
cons_thomas_florent_tue_aft = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 16:00 +0100"))
cons_thomas_alexandre_tue_aft = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 18:30:00 +0100"))

# Consultations du mercredi
cons_thomas_alexandre_wed = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 07:00 +0100"))
cons_thomas_joseph_wed = Consultation.create!(patient: joseph, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 08:30 +0100"))
cons_thomas_catherine_wed = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 10:00 +0100"))
cons_thomas_florent_wed = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 11:00 +0100"))
cons_thomas_jade_wed = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 13:00 +0100"))
cons_thomas_catherine_wed_aft = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 14:30 +0100"))
cons_thomas_florent_wed_aft = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 16:00 +0100"))
cons_thomas_alexandre_wed_aft = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 18:30:00 +0100"))

# Consultations du jeudi
cons_thomas_alexandre_thu = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 07:00 +0100"))
cons_thomas_joseph_thu = Consultation.create!(patient: joseph, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 08:30 +0100"))
cons_thomas_catherine_thu = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 10:00 +0100"))
cons_thomas_florent_thu = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 11:00 +0100"))
cons_thomas_jade_thu = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 13:00 +0100"))
cons_thomas_catherine_thu_aft = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 14:30 +0100"))
cons_thomas_florent_thu_aft = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 16:00 +0100"))
cons_thomas_alexandre_thu_aft = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 18:30:00 +0100"))

# Consultations du vendredi
cons_thomas_alexandre_fri = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 07:00 +0100"))
cons_thomas_joseph_fri = Consultation.create!(patient: joseph, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 08:30 +0100"))
cons_thomas_catherine_fri = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 10:00 +0100"))
cons_thomas_florent_fri = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 11:00 +0100"))
cons_thomas_jade_fri = Consultation.create!(patient: jade, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 13:00 +0100"))
cons_thomas_catherine_fri_aft = Consultation.create!(patient: catherine, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 14:30 +0100"))
cons_thomas_florent_fri_aft = Consultation.create!(patient: florent, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 16:00 +0100"))
cons_thomas_alexandre_fri_aft = Consultation.create!(patient: alexandre, user: thomas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 18:30:00 +0100"))

# CONSULTATIONS DE NICOLAS
# Consultations du lundi
cons_nicolas_simone_mon = Consultation.create!(patient: simone, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 07:00 +0100"))
cons_nicolas_armand_mon = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 08:30 +0100"))
cons_nicolas_peppin_mon = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 11:00 +0100"))
cons_nicolas_louise_mon = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 14:00 +0100"))
cons_nicolas_louise_mon_next_week = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).next_occurring(:monday).strftime} 14:00 +0100"))
cons_nicolas_clementine_mon = Consultation.create!(patient: clementine, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 16:00 +0100"))
cons_nicolas_armand_mon_aft = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 17:30 +0100"))
cons_nicolas_peppin_mon_aft = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 19:00 +0100"))


# Consultations du mardi
cons_nicolas_simone_tue = Consultation.create!(patient: simone, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 07:00 +0100"))
cons_nicolas_armand_tue = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 08:30 +0100"))
cons_nicolas_peppin_tue = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 11:00 +0100"))
cons_nicolas_louise_tue = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 14:00 +0100"))
cons_nicolas_louise_tue_next_week = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).next_occurring(:tuesday).strftime} 14:00 +0100"))
cons_nicolas_clementine_tue = Consultation.create!(patient: clementine, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 16:00 +0100"))
cons_nicolas_armand_tue_aft = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 17:30 +0100"))
cons_nicolas_peppin_tue_aft = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 19:00 +0100"))

# Consultations du mercredi
cons_nicolas_simone_wed = Consultation.create!(patient: simone, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 07:00 +0100"))
cons_nicolas_armand_wed = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 08:30 +0100"))
cons_nicolas_peppin_wed = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 11:00 +0100"))
cons_nicolas_louise_wed = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 14:00 +0100"))
cons_nicolas_louise_wed_next_week = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).next_occurring(:wednesday).strftime} 14:00 +0100"))
cons_nicolas_clementine_wed = Consultation.create!(patient: clementine, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 16:00 +0100"))
cons_nicolas_armand_wed_aft = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 17:30 +0100"))
cons_nicolas_peppin_wed_aft = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 19:00 +0100"))

# Consultations du jeudi
cons_nicolas_simone_thu = Consultation.create!(patient: simone, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 07:00 +0100"))
cons_nicolas_armand_thu = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 08:30 +0100"))
cons_nicolas_peppin_thu = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 11:00 +0100"))
cons_nicolas_louise_thu = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 14:00 +0100"))
cons_nicolas_louise_thu_next_week = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).next_occurring(:thursday).strftime} 14:00 +0100"))
cons_nicolas_clementine_thu = Consultation.create!(patient: clementine, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 16:00 +0100"))
cons_nicolas_armand_thu_aft = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 17:30 +0100"))
cons_nicolas_peppin_thu_aft = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 19:00 +0100"))

# Consultations du vendredi
cons_nicolas_simone_fri = Consultation.create!(patient: simone, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 07:00 +0100"))
cons_nicolas_armand_fri = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 08:30 +0100"))
cons_nicolas_peppin_fri = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 11:00 +0100"))
cons_nicolas_louise_fri = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 14:00 +0100"))
cons_nicolas_louise_fri_next_week = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).next_occurring(:friday).strftime} 14:00 +0100"))
cons_nicolas_clementine_fri = Consultation.create!(patient: clementine, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 16:00 +0100"))
cons_nicolas_armand_fri_aft = Consultation.create!(patient: armand, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 17:30 +0100"))
cons_nicolas_peppin_fri_aft = Consultation.create!(patient: peppin, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 19:00 +0100"))

# Consultations du samedi
cons_nicolas_louise_sat = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:saturday).strftime} 14:00 +0100"))
cons_nicolas_louise_sat_next_week = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:saturday).next_occurring(:saturday).strftime} 14:00 +0100"))

# Consultations du dimanche
cons_nicolas_louise_sun = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:sunday).strftime} 14:00 +0100"))
cons_nicolas_louise_sun_next_week = Consultation.create!(patient: louise, user: nicolas, start_date: DateTime.parse("#{Date.today.next_occurring(:sunday).next_occurring(:sunday).strftime} 14:00 +0100"))

# CONSULTATIONS DE CECILE
# Consultations du lundi
cons_cecile_zdenek_mon = Consultation.create!(patient: zdenek, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 07:00 +0100"))
cons_cecile_bellamy_mon = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 08:30 +0100"))
cons_cecile_aubrey_mon = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 11:00 +0100"))
cons_cecile_ancelina_mon = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 15:00 +0100"))
cons_cecile_ginette_mon = Consultation.create!(patient: ginette, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 18:00 +0100"))
cons_cecile_bellamy_mon_aft = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 19:30 +0100"))
cons_cecile_aubrey_mon_aft = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 20:00 +0100"))
cons_cecile_ancelina_mon_aft = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:monday).strftime} 21:00 +0100"))

# Consultations du mardi
cons_cecile_zdenek_tue = Consultation.create!(patient: zdenek, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 07:00 +0100"))
cons_cecile_bellamy_tue = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 08:30 +0100"))
cons_cecile_aubrey_tue = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 11:00 +0100"))
cons_cecile_ancelina_tue = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 15:00 +0100"))
cons_cecile_ginette_tue = Consultation.create!(patient: ginette, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 18:00 +0100"))
cons_cecile_bellamy_tue_aft = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 19:30 +0100"))
cons_cecile_aubrey_tue_aft = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 20:00 +0100"))
cons_cecile_ancelina_tue_aft = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:tuesday).strftime} 21:00 +0100"))

# Consultations du mercredi
cons_cecile_zdenek_wed = Consultation.create!(patient: zdenek, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 07:00 +0100"))
cons_cecile_bellamy_wed = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 08:30 +0100"))
cons_cecile_aubrey_wed = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 11:00 +0100"))
cons_cecile_ancelina_wed = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 15:00 +0100"))
cons_cecile_ginette_wed = Consultation.create!(patient: ginette, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 18:00 +0100"))
cons_cecile_bellamy_wed_aft = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 19:30 +0100"))
cons_cecile_aubrey_wed_aft = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 20:00 +0100"))
cons_cecile_ancelina_wed_aft = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:wednesday).strftime} 21:00 +0100"))

# Consultations du jeudi
cons_cecile_zdenek_thu = Consultation.create!(patient: zdenek, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 07:00 +0100"))
cons_cecile_bellamy_thu = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 08:30 +0100"))
cons_cecile_aubrey_thu = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 11:00 +0100"))
cons_cecile_ancelina_thu = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 15:00 +0100"))
cons_cecile_ginette_thu = Consultation.create!(patient: ginette, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 18:00 +0100"))
cons_cecile_bellamy_thu_aft = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 19:30 +0100"))
cons_cecile_aubrey_thu_aft = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 20:00 +0100"))
cons_cecile_ancelina_thu_aft = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:thursday).strftime} 21:00 +0100"))

# Consultations du vendredi
cons_cecile_zdenek_fri = Consultation.create!(patient: zdenek, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 07:00 +0100"))
cons_cecile_bellamy_fri = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 08:30 +0100"))
cons_cecile_aubrey_fri = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 11:00 +0100"))
cons_cecile_ancelina_fri = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 15:00 +0100"))
cons_cecile_ginette_fri = Consultation.create!(patient: ginette, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 18:00 +0100"))
cons_cecile_bellamy_fri_aft = Consultation.create!(patient: bellamy, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 19:30 +0100"))
cons_cecile_aubrey_fri_aft = Consultation.create!(patient: aubrey, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 20:00 +0100"))
cons_cecile_ancelina_fri_aft = Consultation.create!(patient: ancelina, user: cecile, start_date: DateTime.parse("#{Date.today.next_occurring(:friday).strftime} 21:00 +0100"))

puts "loading treatments..."

# TRAITEMENTS

# Patients de Thomas :

# Alexandre - plaie à nettoyer et panser + doliprane
# Catherine - Perfusion + Insuline
# Florent - Prise de sang + Glucophage
# Joseph - Prise de sang
# Jade - Points de suture

# Patients de Nicolas :

# Simone - plaie à nettoyer et panser + doliprane
# Armand - Perfusion + Insuline
# Peppin - Prise de sang + Glucophage
# Louise - Prise de sang
# Clementine - Points de suture

# Patients de Cécile :

# Zdenek - plaie à nettoyer et panser + doliprane
# Bellamy - Perfusion + Insuline
# Aubrey - Prise de sang + Glucophage
# Ancelina - Prise de sang
# Ginette - Points de suture


# Alexandre, Simone et Zdenek - plaie à panser et nettoyer + doliprane
# Thomas > Alexandre
Treatment.create!(category: "Diabétique", done: true, content: "Mesure de la glycémie", consultation: cons_thomas_alexandre_past1)
Treatment.create!(category: "Diabétique", done: false, content: "Mesure de la glycémie", consultation: cons_thomas_alexandre_today)
Treatment.create!(category: "Diabétique", done: false, content: "Injection d'insuline", consultation: cons_thomas_alexandre_today)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_thomas_alexandre_mon)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_thomas_alexandre_mon)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_thomas_alexandre_mon)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_thomas_alexandre_tue)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_thomas_alexandre_tue)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_thomas_alexandre_tue)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_thomas_alexandre_wed)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_thomas_alexandre_wed)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_thomas_alexandre_wed)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_thomas_alexandre_thu)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_thomas_alexandre_thu)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_thomas_alexandre_thu)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_thomas_alexandre_fri)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_thomas_alexandre_fri)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_thomas_alexandre_fri)

# Nicolas > Simone
Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_nicolas_simone_mon)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_nicolas_simone_tue)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_nicolas_simone_wed)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_nicolas_simone_thu)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_nicolas_simone_fri)

# Cécile > Zdenek
Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_cecile_zdenek_mon)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_cecile_zdenek_mon)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_cecile_zdenek_mon)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_cecile_zdenek_tue)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_cecile_zdenek_tue)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_cecile_zdenek_tue)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_cecile_zdenek_wed)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_cecile_zdenek_wed)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_cecile_zdenek_wed)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_cecile_zdenek_thu)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_cecile_zdenek_thu)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_cecile_zdenek_thu)

Treatment.create!(category: "Pansement", done: false, content: "Renouveler le pansement", consultation: cons_cecile_zdenek_fri)
Treatment.create!(category: "Hygiène", done: false, content: "Nettoyer la plaie", consultation: cons_cecile_zdenek_fri)
Treatment.create!(category: "Médicament", done: false, content: "Administrer 2mg de doliprane", consultation: cons_cecile_zdenek_fri)

# Catherine, Armand, Bellamy
# Thomas > Catherine - Hygiène / aide à la douche
Treatment.create!(category: "Hygiène", done: false, content: "Aide à la douche", consultation: cons_thomas_catherine_today)

Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_thomas_catherine_mon)

Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_thomas_catherine_tue)

Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_thomas_catherine_wed)

Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_thomas_catherine_thu)

Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_thomas_catherine_fri)

# Nicolas > Armand
Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: cons_nicolas_armand_mon)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: cons_nicolas_armand_mon)

Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: cons_nicolas_armand_tue)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: cons_nicolas_armand_tue)

Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: cons_nicolas_armand_wed)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: cons_nicolas_armand_wed)

Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: cons_nicolas_armand_thu)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: cons_nicolas_armand_thu)

Treatment.create!(category: "Perfusion", done: false, content: "Poser la perfusion", consultation: cons_nicolas_armand_fri)
Treatment.create!(category: "Injection", done: false, content: "Injecter 12 mg d'insuline", consultation: cons_nicolas_armand_fri)

# Cécile > Bellamy
Treatment.create!(category: "Autre", done: false, content: "Pose alimentation parentéral", consultation: cons_cecile_bellamy_mon)
Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_cecile_bellamy_mon)

Treatment.create!(category: "Autre", done: false, content: "Pose alimentation parentéral", consultation: cons_cecile_bellamy_tue)
Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_cecile_bellamy_tue)

Treatment.create!(category: "Autre", done: false, content: "Pose alimentation parentéral", consultation: cons_cecile_bellamy_wed)
Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_cecile_bellamy_wed)

Treatment.create!(category: "Autre", done: false, content: "Pose alimentation parentéral", consultation: cons_cecile_bellamy_thu)
Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_cecile_bellamy_thu)

Treatment.create!(category: "Autre", done: false, content: "Pose alimentation parentéral", consultation: cons_cecile_bellamy_fri)
Treatment.create!(category: "Hygiène", done: false, content: "aide à la douche", consultation: cons_cecile_bellamy_fri)

# Florent, Peppin, Aubrey - Prise de sang + Glucophage
# Thomas > Florent
Treatment.create!(category: "Autre", done: false, content: "Sondage urinaire", consultation: cons_thomas_florent_today)
Treatment.create!(category: "Hygiène", done: false, content: "Toilette complète au lit", consultation: cons_thomas_florent_today)
Treatment.create!(category: "Pansement", done: false, content: "Pansement d’escarre", consultation: cons_thomas_florent_today)

Treatment.create!(category: "Autre", done: false, content: "Sondage urinaire", consultation: cons_thomas_florent_mon)
Treatment.create!(category: "Hygiène", done: false, content: "Toilette complète au lit", consultation: cons_thomas_florent_mon)
Treatment.create!(category: "Pansement", done: false, content: "Pansement d’escarre", consultation: cons_thomas_florent_mon)

Treatment.create!(category: "Autre", done: false, content: "Sondage urinaire", consultation: cons_thomas_florent_tue)
Treatment.create!(category: "Hygiène", done: false, content: "Toilette complète au lit", consultation: cons_thomas_florent_tue)
Treatment.create!(category: "Pansement", done: false, content: "Pansement d’escarre", consultation: cons_thomas_florent_tue)

Treatment.create!(category: "Autre", done: false, content: "Sondage urinaire", consultation: cons_thomas_florent_wed)
Treatment.create!(category: "Hygiène", done: false, content: "Toilette complète au lit", consultation: cons_thomas_florent_wed)
Treatment.create!(category: "Pansement", done: false, content: "Pansement d’escarre", consultation: cons_thomas_florent_wed)

Treatment.create!(category: "Autre", done: false, content: "Sondage urinaire", consultation: cons_thomas_florent_thu)
Treatment.create!(category: "Hygiène", done: false, content: "Toilette complète au lit", consultation: cons_thomas_florent_thu)
Treatment.create!(category: "Pansement", done: false, content: "Pansement d’escarre", consultation: cons_thomas_florent_thu)

Treatment.create!(category: "Autre", done: false, content: "Sondage urinaire", consultation: cons_thomas_florent_fri)
Treatment.create!(category: "Hygiène", done: false, content: "Toilette complète au lit", consultation: cons_thomas_florent_fri)
Treatment.create!(category: "Pansement", done: false, content: "Pansement d’escarre", consultation: cons_thomas_florent_fri)

# Nicolas > Peppin
Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_nicolas_peppin_mon)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_nicolas_peppin_mon)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_nicolas_peppin_tue)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_nicolas_peppin_tue)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_nicolas_peppin_wed)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_nicolas_peppin_wed)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_nicolas_peppin_thu)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_nicolas_peppin_thu)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_nicolas_peppin_fri)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_nicolas_peppin_fri)

# Cécile > Aubrey
Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_aubrey_mon)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_cecile_aubrey_mon)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_aubrey_tue)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_cecile_aubrey_tue)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_aubrey_wed)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_cecile_aubrey_wed)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_aubrey_thu)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_cecile_aubrey_thu)

Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_aubrey_fri)
Treatment.create!(category: "Diabétique", done: false, content: "Administrer 10mg de Glucophage", consultation: cons_cecile_aubrey_fri)


# Joseph, Louise, Ancelina - Prise de sang
# Thomas > Joseph
Treatment.create!(category: "Injection", done: false, content: "sous cutanée (EPO)", consultation: cons_thomas_joseph_today)
Treatment.create!(category: "Injection", done: false, content: "sous cutanée (EPO)", consultation: cons_thomas_joseph_mon)
Treatment.create!(category: "Injection", done: false, content: "sous cutanée (EPO)", consultation: cons_thomas_joseph_tue)
Treatment.create!(category: "Injection", done: false, content: "sous cutanée (EPO)", consultation: cons_thomas_joseph_wed)
Treatment.create!(category: "Injection", done: false, content: "sous cutanée (EPO)", consultation: cons_thomas_joseph_thu)
Treatment.create!(category: "Injection", done: false, content: "sous cutanée (EPO)", consultation: cons_thomas_joseph_fri)

# Nicolas > Louise
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_mon)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_mon_next_week)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_tue)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_tue_next_week)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_wed)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_wed_next_week)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_thu)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_thu_next_week)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_fri)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_fri_next_week)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_sat)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_sat_next_week)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_sun)
Treatment.create!(category: "Autre", done: false, content: "Surveillance des constantes", consultation: cons_nicolas_louise_sun_next_week)

# Cécile > Ancelina
Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_ancelina_mon)
Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_ancelina_tue)
Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_ancelina_wed)
Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_ancelina_thu)
Treatment.create!(category: "Prélèvement", done: false, content: "Prélever 5ml de sang", consultation: cons_cecile_ancelina_fri)

# Jade, Clémentine, Ginette - Points de suture
# Thomas > Jade
Treatment.create!(category: "Autre", done: false, content: "Ablation de points", consultation: cons_thomas_jade_today)
Treatment.create!(category: "Autre", done: false, content: "Ablation de points", consultation: cons_thomas_jade_mon)
Treatment.create!(category: "Autre", done: false, content: "Ablation de points", consultation: cons_thomas_jade_tue)
Treatment.create!(category: "Autre", done: false, content: "Ablation de points", consultation: cons_thomas_jade_wed)
Treatment.create!(category: "Autre", done: false, content: "Ablation de points", consultation: cons_thomas_jade_thu)
Treatment.create!(category: "Autre", done: false, content: "Ablation de points", consultation: cons_thomas_jade_fri)

# Nicolas > Clémentine
Treatment.create!(category: "Perfusion", done: false, content: "hydratation sous cutanée", consultation: cons_nicolas_clementine_mon)
Treatment.create!(category: "Perfusion", done: false, content: "hydratation sous cutanée", consultation: cons_nicolas_clementine_tue)
Treatment.create!(category: "Perfusion", done: false, content: "hydratation sous cutanée", consultation: cons_nicolas_clementine_wed)
Treatment.create!(category: "Perfusion", done: false, content: "hydratation sous cutanée", consultation: cons_nicolas_clementine_thu)
Treatment.create!(category: "Perfusion", done: false, content: "hydratation sous cutanée", consultation: cons_nicolas_clementine_fri)

# Cécile > Ginette
Treatment.create!(category: "Prélèvement", done: false, content: "Prélèvement sanguin", consultation: cons_cecile_ginette_mon)
Treatment.create!(category: "Prélèvement", done: false, content: "Prélèvement sanguin", consultation: cons_cecile_ginette_tue)
Treatment.create!(category: "Prélèvement", done: false, content: "Prélèvement sanguin", consultation: cons_cecile_ginette_wed)
Treatment.create!(category: "Prélèvement", done: false, content: "Prélèvement sanguin", consultation: cons_cecile_ginette_thu)
Treatment.create!(category: "Prélèvement", done: false, content: "Prélèvement sanguin", consultation: cons_cecile_ginette_fri)


puts "loading notes..."

# NOTES
# Notes des consultations de Thomas
Note.create!(content: "Craint les piqûres, ne pas hésitez à rassurer", favorite: true, creation_consultation: cons_thomas_alexandre_today)
note_alexandre = Note.create!(content: "Demander au médecin référent une ordonnance pour médicaments", favorite: false, creation_consultation: cons_thomas_alexandre_mon)
Note.create!(content: "Craint les piqûres, ne pas hésitez à rassurer", favorite: true, creation_consultation: cons_thomas_catherine_today)
note_catherine = Note.create!(content: "Patient sensible lors des piqures, rassurer et injecter délicatement", favorite: false, creation_consultation: cons_thomas_catherine_mon)
note_florent = Note.create!(content: "Lui faire penser d'appeler sa petite fille par son prénom et non par celui de sa femme", favorite: false, creation_consultation: cons_thomas_florent_mon)
note_joseph = Note.create!(content: "Attention chien méchant, attendre au portail", favorite: true, creation_consultation: cons_thomas_joseph_mon)
note_jade = Note.create!(content: "Rassurer la patiente pendant la suture", favorite: true, creation_consultation: cons_thomas_jade_mon)

# Notes des consultations de Nicolas
note_simone = Note.create!(content: "Demander au médecin référent une ordonnance pour médicaments", favorite: false, creation_consultation: cons_nicolas_simone_mon)
note_armand = Note.create!(content: "Patient sensible lors des piqures, rassurer et injecter délicatement", favorite: true, creation_consultation: cons_nicolas_armand_mon)
note_peppin = Note.create!(content: "Lui faire penser d'appeler sa petite fille par son prénom et non par celui de sa femme", favorite: false, creation_consultation: cons_nicolas_peppin_mon)
note_louise = Note.create!(content: "Attention chien méchant, attendre au portail", favorite: true, creation_consultation: cons_nicolas_louise_mon)
note_clementine = Note.create!(content: "Rassurer la patiente pendant la suture", favorite: true, creation_consultation: cons_nicolas_clementine_mon)

# Notes des consultations de Cécile
note_zdenek = Note.create!(content: "Demander au médecin référent une ordonnance pour médicaments", favorite: false, creation_consultation: cons_cecile_zdenek_mon)
note_bellamy = Note.create!(content: "Patient sensible lors des piqures, rassurer et injecter délicatement", favorite: true, creation_consultation: cons_cecile_bellamy_mon)
note_aubrey = Note.create!(content: "Lui faire penser d'appeler sa petite fille par son prénom et non par celui de sa femme", favorite: false, creation_consultation: cons_cecile_aubrey_mon)
note_ancelina = Note.create!(content: "Attention chien méchant, attendre au portail", favorite: true, creation_consultation: cons_cecile_ancelina_mon)
note_ginette = Note.create!(content: "Rassurer la patiente pendant la suture", favorite: true, creation_consultation: cons_cecile_ginette_mon)

puts "End of seeds!"

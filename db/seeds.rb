
Session.delete_all
Patient.delete_all
Therapist.delete_all

session_1 = Session.create(:date=>'01/01/2020', :completed=>true)
session_2 = Session.create(:date=>'02/02/2020', :completed=>true)
session_3 = Session.create(:date=>'03/03/2020', :completed=>true)
session_4 = Session.create(:date=>'04/04/2020', :completed=>false)
session_5 = Session.create(:date=>'05/05/2020', :completed=>true)
session_6 = Session.create(:date=>'06/06/2020', :completed=>true)
session_7 = Session.create(:date=>'01/01/2021', :completed=>true)
session_8 = Session.create(:date=>'02/02/2021', :completed=>false)

patient_1 = Patient.create(:chosen_name=>'Anna', :location=> 'Chicago', :phone_number=> '123-456-7890', :email=>'anna@gmail.com')
patient_2 = Patient.create(:chosen_name=>'Bob', :location=> 'Chicago', :phone_number=> '999-555-2222', :email=>'bob@gmail.com')
patient_3 = Patient.create(:chosen_name=>'Carol', :location=> 'Chicago', :phone_number=> '111-222-3333', :email=>'carol@gmail.com')
patient_4 = Patient.create(:chosen_name=>'Derek', :location=> 'Chicago', :phone_number=> '890-345-6789', :email=>'derek@gmail.com')
patient_5 = Patient.create(:chosen_name=>'Emily', :location=> 'New York', :phone_number=> '222-908-7896', :email=>'emily@gmail.com')

patient_1.save
patient_2.save
patient_3.save
patient_4.save
patient_5.save

therapist_1 = Therapist.create(:chosen_name=>'Anthony', :location=> 'Chicago', :phone_number=> '124-456-7890', :email=>'anthony@gmail.com')
therapist_2 = Therapist.create(:chosen_name=>'Brittany', :location=> 'New York', :phone_number=> '997-555-2332', :email=>'brittany@gmail.com')
therapist_3 = Therapist.create(:chosen_name=>'Chris', :location=> 'New York', :phone_number=> '134-234-3444', :email=>'chris@gmail.com')
therapist_4 = Therapist.create(:chosen_name=>'Danielle', :location=> 'New York', :phone_number=> '908-322-6029', :email=>'danielle@gmail.com')
therapist_5 = Therapist.create(:chosen_name=>'Edgar', :location=> 'New York', :phone_number=> '299-228-7444', :email=>'edgar@gmail.com')

therapist_1.save
therapist_2.save
therapist_3.save
therapist_4.save
therapist_5.save

session_1.patient = patient_1
session_2.patient = patient_2
session_3.patient = patient_3
session_4.patient = patient_4
session_5.patient = patient_5
session_6.patient = patient_5
session_7.patient = patient_5
session_8.patient = patient_5

session_1.therapist = therapist_1
session_2.therapist = therapist_1
session_3.therapist = therapist_1
session_4.therapist = therapist_1
session_5.therapist = therapist_2
session_6.therapist = therapist_3
session_7.therapist = therapist_4
session_8.therapist = therapist_5

patient_1.sessions << session_1
patient_2.sessions << session_2
patient_3.sessions << session_3
patient_4.sessions << session_4
patient_5.sessions << session_5
patient_5.sessions << session_6
patient_5.sessions << session_7
patient_5.sessions << session_8

therapist_1.sessions << session_1
therapist_1.sessions << session_2
therapist_1.sessions << session_3
therapist_1.sessions << session_4
therapist_2.sessions << session_5
therapist_3.sessions << session_6
therapist_4.sessions << session_7
therapist_5.sessions << session_8


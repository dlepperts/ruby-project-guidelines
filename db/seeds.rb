
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

patient_1 = Patient.create(:username=> 'annabananna', :chosen_name=>'Anna', :location=> 'Chicago', :phone_number=> '123-456-7890', :email=>'anna@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Bisexual', :sex_at_birth=> 'F', :race=> 'White', :age=> 22, :insurance=> 'Gold')
patient_2 = Patient.create(:username=> 'bobthebuilder', :chosen_name=>'Bob', :location=> 'Chicago', :phone_number=> '999-555-2222', :email=>'bob@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Gay', :sex_at_birth=> 'M', :race=> 'Black', :age=> 34,  :insurance=> 'Silver')
patient_3 = Patient.create(:username=> 'christmascarols', :chosen_name=>'Carol', :location=> 'Chicago', :phone_number=> '111-222-3333', :email=>'carol@gmail.com', :gender_id=> 'Non-Binary', :sexual_id=> 'Pansexual', :sex_at_birth=> 'F', :race=> 'Asian', :age=> 46,  :insurance=> 'Gold')
patient_4 = Patient.create(:username=> 'derekshepard', :chosen_name=>'Derek', :location=> 'Chicago', :phone_number=> '890-345-6789', :email=>'derek@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Lesbian', :sex_at_birth=> 'M', :race=> 'Latino', :age=> 78, :insurance=> 'Silver')
patient_5 = Patient.create(:username=> 'emilywho', :chosen_name=>'Emily', :location=> 'New York', :phone_number=> '222-908-7896', :email=>'emily@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Asexual', :sex_at_birth=> 'F', :race=> 'Native American', :age=> 76, :insurance=> 'Gold')
patient_6 = Patient.create(:username=> 'fannypack', :chosen_name=>'Fanny', :location=> 'New York', :phone_number=> '222-908-7896', :email=>'fanny@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Pansexual', :sex_at_birth=> 'F', :race=> 'White' , :age=> 99, :insurance=> 'Silver')
patient_7 = Patient.create(:username=> 'Gertygert', :chosen_name=>'Gertrude', :location=> 'New York', :phone_number=> '222-908-7896', :email=>'gertrude@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Lesbian', :sex_at_birth=> 'F', :race=> 'Black', :age=> 26, :insurance=> 'Gold')
patient_8 = Patient.create(:username=> 'Styles', :chosen_name=>'Harry', :location=> 'New York', :phone_number=> '222-908-7896', :email=>'harry@gmail.com', :gender_id=> 'Non-Binary', :sexual_id=> 'Asexual', :sex_at_birth=> 'M', :race=> 'Asian', :age=> 33, :insurance=> 'Silver')


patient_1.save
patient_2.save
patient_3.save
patient_4.save
patient_5.save
patient_6.save
patient_7.save
patient_8.save


therapist_1 = Therapist.create(:username=> 'anTENy', :chosen_name=>'Anthony', :location=> 'Chicago', :phone_number=> '124-456-7890', :email=>'anthony@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Bisexual', :sex_at_birth=> 'M', :race=> 'White', :age=> 26, :lcpc=> true, :lcp=> false, :lmhc=> false, :mft=> false, :lcsw=> false, :cmhimp=> false, :education=> 'MA', :insurance=>'Gold')
therapist_2 = Therapist.create(:username=> 'Brit', :chosen_name=>'Brittany', :location=> 'Chicago', :phone_number=> '997-555-2332', :email=>'brittany@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Gay', :sex_at_birth=> 'M', :race=> 'Black', :age=> 34, :lcpc=> false, :lcp=> true, :lmhc=> false, :mft=> false, :lcsw=> false, :cmhimp=> false, :education=> 'MS', :insurance=>'Silver')
therapist_3 = Therapist.create(:username=> 'Chrischris', :chosen_name=>'Chris', :location=> 'Chicago', :phone_number=> '134-234-3444', :email=>'chris@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Straight', :sex_at_birth=> 'F', :race=> 'Latino', :age=> 45, :lcpc=> false, :lcp=> false, :lmhc=> true, :mft=> false, :lcsw=> false, :cmhimp=> false, :education=> 'DNP', :insurance=>'Gold')
therapist_4 = Therapist.create(:username=> 'danielleie', :chosen_name=>'Danielle', :location=> 'Chicago', :phone_number=> '908-322-6029', :email=>'danielle@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Pansexual', :sex_at_birth=> 'F', :race=> 'Asian', :age=> 55, :lcpc=> true, :lcp=> false, :lmhc=> false, :mft=> true, :lcsw=> false, :cmhimp=> true, :education=> 'PhD', :insurance=>'Silver')
therapist_5 = Therapist.create(:username=> 'allenpoe', :chosen_name=>'Edgar', :location=> 'Chicago', :phone_number=> '299-228-7444', :email=>'edgar@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Lesbian', :sex_at_birth=> 'M', :race=> 'Native American', :age=> 68, :lcpc=> false, :lcp=> true, :lmhc=> false, :mft=> true, :lcsw=> false, :cmhimp=> false, :education=> 'PsyD', :insurance=>'Gold')
therapist_6 = Therapist.create(:username=> 'franky', :chosen_name=>'Frank', :location=> 'Chicago', :phone_number=> '222-908-7896', :email=>'frank@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Straight', :sex_at_birth=> 'M', :race=> 'White', :age=> 75, :lcpc=> false, :lcp=> false, :lmhc=> false, :mft=> false, :lcsw=> true, :cmhimp=> true, :education=> 'PsyD', :insurance=> 'Silver')
therapist_7 = Therapist.create(:username=> 'OMally', :chosen_name=>'George', :location=> 'Chicago', :phone_number=> '111-908-7896', :email=>'george@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Asexual', :sex_at_birth=> 'F', :race=> 'Black', :age=> 63, :lcpc=> false, :lcp=> false, :lmhc=> false, :mft=> true, :lcsw=> true, :cmhimp=> true, :education=> 'MS', :insurance=> 'Gold')
therapist_8 = Therapist.create(:username=> 'Hildagirl007', :chosen_name=>'Hilda', :location=> 'Chicago', :phone_number=> '333-908-7896', :email=>'hilda@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Pansexual', :sex_at_birth=> 'F', :race=> 'Latino', :age=> 56, :lcpc=> false, :lcp=> false, :lmhc=> false, :mft=> false, :lcsw=> true, :cmhimp=> false, :education=> 'MA', :insurance=> 'Silver')
therapist_9 = Therapist.create(:username=> 'Michaelson', :chosen_name=>'Ingrid', :location=> 'Chicago', :phone_number=> '444-908-7896', :email=>'ingrid@gmail.com', :gender_id=> 'Non-Binary', :sexual_id=> 'Asexual', :sex_at_birth=> 'F', :race=> 'Asian', :age=> 44, :lcpc=> false, :lcp=> false, :lmhc=> true, :mft=> true, :lcsw=> true, :cmhimp=> false, :education=> 'PhD', :insurance=> 'Gold')
therapist_10 = Therapist.create(:username=> 'withajnotag', :chosen_name=>'Jiana', :location=> 'Chicago', :phone_number=> '555-908-7896', :email=>'jiana@gmail.com', :gender_id=> 'Non-Binary', :sexual_id=> 'Pansexual', :sex_at_birth=> 'M', :race=> 'Native American', :age=> 33, :lcpc=> true, :lcp=> false , :lmhc=> false, :mft=> true , :lcsw=> true , :cmhimp=> false, :education=> 'PhD', :insurance=> 'Silver')
therapist_11 = Therapist.create(:username=> 'kellayyyy', :chosen_name=>'Kelly', :location=> 'New York', :phone_number=> '666-908-7896', :email=>'kelly@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Straight', :sex_at_birth=> 'F', :race=> 'White', :age=> 85, :lcpc=> false, :lcp=> false, :lmhc=> true, :mft=> true, :lcsw=> false, :cmhimp=> true, :education=> 'MS', :insurance=> 'Gold')
therapist_12 = Therapist.create(:username=> 'lovestolaugh', :chosen_name=>'Linda', :location=> 'New York', :phone_number=> '777-908-7896', :email=>'linda@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Gay', :sex_at_birth=> 'F', :race=> 'Black', :age=> 79, :lcpc=> true, :lcp=> true , :lmhc=> false, :mft=> true , :lcsw=> true , :cmhimp=> false, :education=> 'MA', :insurance=> 'Silver')
therapist_13 = Therapist.create(:username=> 'Michael101', :chosen_name=>'Michael', :location=> 'New York', :phone_number=> '888-908-7896', :email=>'michael@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Asexual', :sex_at_birth=> 'M', :race=> 'Latino', :age=> 66, :lcpc=> true, :lcp=> false, :lmhc=> false, :mft=> true, :lcsw=> false, :cmhimp=> true, :education=> 'MS', :insurance=> 'Gold')
therapist_14 = Therapist.create(:username=> 'andtheark', :chosen_name=>'Noah', :location=> 'New York', :phone_number=> '999-908-7896', :email=>'noah@gmail.com', :gender_id=> 'Man', :sexual_id=> 'Pansexual', :sex_at_birth=> 'M', :race=> 'Asian', :age=> 52, :lcpc=> false, :lcp=> true, :lmhc=> true, :mft=> true , :lcsw=> false, :cmhimp=> true, :education=> 'PsyD', :insurance=> 'Silver')
therapist_15 = Therapist.create(:username=> 'Olives', :chosen_name=>'Oivia', :location=> 'New York', :phone_number=> '000-908-7896', :email=>'olivia@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Straight', :sex_at_birth=> 'M', :race=> 'Native American', :age=> 46, :lcpc=> false, :lcp=> true, :lmhc=> false , :mft=> false, :lcsw=> false , :cmhimp=> true, :education=> 'DNP', :insurance=> 'Gold')
therapist_16 = Therapist.create(:username=> 'penelope99', :chosen_name=>'Penelope', :location=> 'New York', :phone_number=> '222-111-7896', :email=>'penelope@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Lesbian', :sex_at_birth=> 'F', :race=> 'White', :age=> 33, :lcpc=> false, :lcp=> true, :lmhc=> false, :mft=> true, :lcsw=> true, :cmhimp=> true, :education=> 'DNP', :insurance=> 'Silver')
therapist_17 = Therapist.create(:username=> 'quinlin456', :chosen_name=>'Quinlin', :location=> 'New York', :phone_number=> '222-222-7896', :email=>'quinlin@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Pansexual', :sex_at_birth=> 'F', :race=> 'Black', :age=> 21, :lcpc=> true, :lcp=> true, :lmhc=> true, :mft=> false, :lcsw=> false, :cmhimp=> true, :education=> 'MS', :insurance=> 'Gold')
therapist_18 = Therapist.create(:username=> 'Mcdonald', :chosen_name=> 'Ronald', :location=> 'New York', :phone_number=> '222-333-7896', :email=>'ronald@gmail.com', :gender_id=> 'Woman', :sexual_id=> 'Asexual', :sex_at_birth=> 'M', :race=> 'Latino', :age=> 54, :lcpc=> true, :lcp=> false, :lmhc=> true, :mft=> false, :lcsw=> false, :cmhimp=> false, :education=> 'MS', :insurance=> 'Silver')
therapist_19 = Therapist.create(:username=> 'samyl', :chosen_name=>'Sam', :location=> 'New York', :phone_number=> '222-444-7896', :email=>'sam@gmail.com', :gender_id=> 'Non-Binary', :sexual_id=> 'Asexual', :sex_at_birth=> 'M', :race=> 'Asian', :age=> 35, :lcpc=> false, :lcp=> true, :lmhc=> true, :mft=> true, :lcsw=> false, :cmhimp=> true, :education=> 'MA', :insurance=> 'Gold')
therapist_20 = Therapist.create(:username=> 'tomtom', :chosen_name=>'Tom', :location=> 'New York', :phone_number=> '222-555-7896', :email=>'tom@gmail.com', :gender_id=> 'Non-Binary', :sexual_id=> 'Pansexual', :sex_at_birth=> 'F', :race=> 'Native American', :age=> 49, :lcpc=> true, :lcp=> false, :lmhc=> false, :mft=> true, :lcsw=> false, :cmhimp=> true, :education=> 'MA', :insurance=> 'Silver')

therapist_1.save
therapist_2.save
therapist_3.save
therapist_4.save
therapist_5.save
therapist_6.save
therapist_7.save
therapist_8.save
therapist_9.save
therapist_10.save
therapist_11.save
therapist_12.save
therapist_13.save
therapist_14.save
therapist_15.save
therapist_17.save
therapist_18.save
therapist_19.save
therapist_10.save

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


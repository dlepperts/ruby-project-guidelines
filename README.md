Set Up
-To start run rake -T in the console to see a list of rake commands. 
-Since our files and methods require seed data, you will first need to run rake db:migrate this will allow ActiveRecord to update your db/schema.rb file to match the up-to-date structure of the database.
-You will then need to run rake db:seed to load data from our db/seed.rb file
-You have now successfully updated the database structure and loaded our data! 
Overview
Welcome to the “Therapist Finder” app. This app is tailored to connect LGBTQIA patients with identity affirming therapists within the LGBTQIA community. We understand the importance of safe and inclusive therapy for all, and we strive to give you the best care. 
Our app starts with entering ruby bin/run.rb to start the program! You will then be prompted through our app system with questions to help narrow your search. This will help you find the best provider for your individual needs. 
Instructions
Patients, please follow along!
1.Enter a username if you are an existing user, create a username if you are new to our site!
2.With an existing username entered, you are now able to access therapists, manage appointments, change settings, and even see how many sessions you've completed.
3.Finding a therapist. Our app does the work for you, and has now linked you with therapist in your area who also take your insurance!  
4.You are now able to narrow your search. You can find a therapist with the exact same identities as you. You are also able to find a therapist based on certain selected identities, which include gender identity, sexual orientation, and race.
5.Ready to book an appointment? Just choose the therapist from the list provided.
6.Make sure to set the date of your appointment, by entering it in the format of MM/DD/YYYY
7.You are now able to view all of your past and future sessions!
8.Need to manage your appointments? We got you covered!
9.Head back to the Home Screen to access Manage Your Appointments
10.If you know your therapist, you are able to book an appointment directly.
11.You can also view your past and future sessions through Manage Your Appointments
We hope you were able to successfully find a therapist that fits your needs and identities! The care provided by our service is the upmost importance. Your health and well being is our top priority. Because of our commitment to provided you a safe therapy experience, we have created an anonymous incident report form, that can be accessed on our website at www.therapistfinder.com/incidentreport  
If you have any questions, concerns, or issues, please contact us at help@therapistfinder.com. 
***this app requires local gems, use gem list in your terminal to confirm gems listed in Gemfile are installed. To install gems needed, run: gem install name_of_the_gem_needed.
This project is licensed under the terms of the [Flatiron Educational Content License] (http://learn.co/content-license) (http://learn.co/content-license).

class CLI

    def run
        sign_in
        patient_home
    end

    def clear_screen
        system "clear"
    end

    def divider
        puts "*" * 30
        puts "\n"
        pause
    end

    def get_user_input
        gets.chomp
    end

    def pause
        sleep 1
    end

    def sign_in
        clear_screen
        puts "Welcome!"
        divider

        puts "Are you a patient or a therapist?"
        puts "T) Therapist"
        puts "P) Patient"

        type_of_user = get_user_input.upcase
        if type_of_user == 'P'
            enter_a_username
            @current_user = Patient.find_or_create_by(username: @username)
        elsif type_of_user == 'T'
            enter_a_username
            @current_user = Therapist.find_or_create_by(username: @username)
        end
    end

    def enter_a_username
        puts "Enter a new or existing USERNAME"
        @username = get_user_input
    end

    def patient_home 

        clear_screen
        puts "Hi #{@current_user.username}, you have #{get_completed_sessions.count} completed sessions"
        divider

        puts "Select from the choices below:"
        puts "F) Find a Therapist"
        puts "M) Manage Appointments"
        puts "S) Settings"
        puts "\n~~ (Q)uit or (R)estart ~~"
        
        choice = get_user_input.upcase
    
        case choice
        when "F"
            find_therapists
        when "M"
            manage_appointments
        when "S"
            settings
        when "R" || "RESTART"
          run
        when "Q" || "QUIT"
        else
          incorrect_selection
        end
    end

    def settings
        puts "What would you like to do?"
        puts "1) Set a default therapist"
        choice = get_user_input
        case choice
        when "1"
            chose_a_regular_therapist
        else
            incorrect_selection
        end
    end

    def manage_appointments
        puts "What would you like to do?"
        puts "B) Book an appointment"
        puts "V) View my sessions"
        choice = get_user_input.upcase
        case choice
        when 'B'
            book_an_appointment
        when 'V'
            get_sessions
            puts 'Where to now?'
            puts 'H) Home'
            puts 'M) Manage Appointments'
            entered_info = get_user_input.upcase
            case entered_info
            when 'H'
                patient_home
            when 'M'
                manage_appointments
            else
                incorrect_selection
            end
        else
            incorrect_selection
        end
    end

    def book_an_appointment
        get_session_date
        puts 'Please enter the id of the therapist you would like to book an appointment with'
        book_with_therapist = get_user_input.upcase
        new_session = Session.new
        new_session.date = @selected_date
        new_session.patient_id = @current_user.id
        new_session.therapist_id = book_with_therapist
        new_session.completed = false
        new_session.save
        puts "Your session has been booked"
    end

    def chose_a_regular_therapist
        @my_therapists = @current_user.therapists
        puts "Here are the therapists you have seen"
        puts @my_therapists.map{|my_therapist| "ID: #{my_therapist.id}, Name: #{my_therapist.chosen_name}"}.uniq
        puts "Enter the ID of the therapist you'd like to set as your default"
        get_default_therapist_id = get_user_input.to_i
        @default_therapist_id = get_default_therapist_id
        @default_therapist = find_all_therapists.select{|therapist| therapist.id == @default_therapist_id}
        puts "Your deafult therapist is #{@default_therapist[0].chosen_name}"
    end

    def my_therapists
        @my_therapists = @current_user.therapists
        @my_therapists.map{|therapist| therapist}.uniq
    end

    def find_therapists
        clear_screen
        puts '*' * 30

        puts 'Here is a list of all therapists in your location that take your insurance:'
        puts print_therapist_names_insurance_and_location
        puts '*' * 30

        puts 'How would you like to find a therapist??'
        puts 'M) Find someone who has the exact same identities'
        puts 'C) Find someone with custom identities'

        search_choice = get_user_input.upcase

        puts '*' * 30

        case search_choice
        when 'M'
            find_therapists_with_same_intersectional_id
            if @therapists.length == 0
                puts "Unfortunately, there are no therapists who have the same intersectional idenitty as you"
                puts "Would you like to do another search?"
                puts "Y) Yes"
                puts "N) No"
                choice = get_user_input.upcase
                case choice
                when 'Y'
                    find_therapists
                when 'N'
                    patient_home
                else
                    incorrect_selection
                end
            else
                puts 'Here are the therapists who have the same identities as you'
                puts print_therapists
            end
        when 'C'
            do_you_have_a_gender_identity_preference?
            gender_choice = get_user_input.upcase
            case gender_choice
            when 'Y'
                get_gender_identity_preference
                do_you_have_a_sexual_identity_preference?
                sex_choice = get_user_input.upcase
                case sex_choice
                when 'Y'
                    get_sexual_identity_preference
                    do_you_have_a_race_preference?
                    race_choice = get_user_input.upcase
                    case race_choice
                    when 'Y'
                        get_race_preference
                        @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @gender_identity_preference and therapist.sexual_id == @sexual_identity_preference and therapist.race == @race_preference}
                        print_therapists
                    when 'N'
                        @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @gender_identity_preference and therapist.sexual_id == @sexual_identity_preference}
                        print_therapists
                    else
                        incorrect_selection
                    end
                when 'N'
                    do_you_have_a_race_preference?
                    race_choice = get_user_input.upcase
                    case race_choice
                    when 'Y'
                        get_race_preference
                        @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @gender_identity_preference and therapist.race == @race_preference}
                        print_therapists
                    when 'N'
                        @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @gender_identity_preference}
                        print_therapists
                    else
                        incorrect_selection
                    end
                else
                    incorrect_selection
                end

            when 'N'
                do_you_have_a_sexual_identity_preference?
                sex_choice = get_user_input.upcase
                case sex_choice
                when 'Y'
                    get_sexual_identity_preference
                    do_you_have_a_race_preference?
                    race_choice = get_user_input.upcase
                    case race_choice
                    when 'Y'
                        get_race_preference
                        @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.sexual_id == @sexual_identity_preference and therapist.race == @race_preference}
                        print_therapists
                    when 'N'
                        @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.sexual_id == @sexual_identity_preference}
                        print_therapists
                    else
                        incorrect_selection
                    end

                when 'N'
                    do_you_have_a_race_preference?
                    race_choice = get_user_input.upcase
                    case race_choice
                    when 'Y'
                        get_race_preference
                        @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.race == @race_preference}
                        print_therapists
                    when 'N'
                        puts print_therapists
                    else
                        incorrect_selection
                    end
                else
                    incorrect_selection
                end
            else
                incorrect_selection
            end
        else
            incorrect_selection
        end
        book_appointment_or_new_search?
    end

    def print_therapists
        puts @therapists.map{|therapist| "ID: #{therapist.id}, Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual identity: #{therapist.sexual_id}, Race: #{therapist.race}, Age: #{therapist.age}"}
    end

    def book_appointment_or_new_search?
        if @therapists.length > 0
            puts "Book an appointment?"
            puts "Y) Yes"
            puts "N) No"
            book_appointment = get_user_input.upcase
            case book_appointment
            when 'Y'  
                if @therapists.length == 1
                    get_session_date
                    new_session = Session.new
                    new_session.date = @selected_date
                    new_session.patient_id = @current_user.id
                    new_session.therapist_id = @therapists[0].id
                    new_session.completed = false
                    new_session.save
                    puts "Your session has been booked!"
                else
                    puts 'Enter the id of the therapist you would like to book an appointment with'
                    @selected_id = get_user_input.to_i
                    selected_therapist = @therapists.select {|therapist| therapist.id == @selected_id}
                    puts 'You have chosen:'
                    puts selected_therapist.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual Identity: #{therapist.sexual_id}, race: #{therapist.race}, age: #{therapist.age}"}
                    get_session_date
                    new_session = Session.new
                    new_session.date = @selected_date
                    new_session.patient_id = @current_user.id
                    new_session.therapist_id = selected_therapist[0].id
                    new_session.completed = false
                    new_session.save
                    puts "Your session has been booked!"
                end
                puts 'Go back?'
                puts 'Y) Yes'
                puts "\n~~ (Q)uit or (R)estart ~~"
                choice = get_user_input.upcase
                case choice
                when 'Y'
                    patient_home
                when 'Q' || "QUIT"
                when "R" || "RESTART"
                    run
                else
                    incorrect_selection
                end
                    
            when 'N'
                puts 'Would you like to search again?'
                search_again?
            end
        elsif @therapists.length == 0
            puts "Your search did not return any results. Would you like to search again?"
            search_again?
        end
    end

    def get_session_date
        puts 'Please enter the date you would like to book an appointment on in the format MM/DD/YYYY'
        @selected_date = get_user_input
    end

    def search_again?
        puts "Y) Yes"
        puts "N) No"
        search_again = get_user_input.upcase
        case search_again
        when 'Y'
            find_therapists
        when 'N'
            patient_home
        else 
            incorrect_selection
        end
    end

    def do_you_have_a_gender_identity_preference?
        puts 'Do you have a gender preference?'
        puts 'Y) Yes'
        puts 'N) No'
    end

    def do_you_have_a_sexual_identity_preference?
        puts 'Do you have a sexual identity preference?'
        puts 'Y) Yes'
        puts 'N) No'
    end

    def do_you_have_a_race_preference?
        puts 'Do you have a preference of what race your therapist is?'
        puts 'Y) Yes'
        puts 'N) No'
    end

    def get_gender_identity_preference
        puts 'What gender identity would you like in a therapist?'
        puts 'Woman'
        puts 'Man'
        puts 'Non-Binary'
        puts 'Other'
        @gender_identity_preference = get_user_input.capitalize
        puts '*' * 30
    end

    def get_sexual_identity_preference
        puts 'What sexual identity would you like in a therapist?'
        puts 'Straight'
        puts 'Gay'
        puts 'Bisexual'
        puts 'Lesbian'
        puts 'Asexual'
        puts 'Pansexual'
        puts 'No Preference'
        @sexual_identity_preference = get_user_input.capitalize
        puts '*' * 30
    end

    def get_race_preference
        puts 'What race would you like in a therapist?'
        puts 'White'
        puts 'Black'
        puts 'Asian'
        puts 'Latino'
        puts 'Native American'
        puts 'Other'
        puts 'No Preference'
        @race_preference = get_user_input.capitalize
        puts '*' * 30
    end

    def get_sessions
        @sessions = @current_user.sessions
        puts @sessions.map{|session| "ID: #{session.id}, Date: #{session.date}, Therapist: #{session.therapist_id}, Completed?: #{session.completed}"}
    end

    def get_completed_sessions
        @sessions = @current_user.sessions
        @sessions.select{|session| session.completed == true}
    end

    def find_all_therapists
        Therapist.all
    end

    def print_therapist_names_insurance_and_location
        @therapists = find_therapists_in_my_location_who_take_my_insurance
        @therapists.map{|therapist| "ID: #{therapist.id}, Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual Identity: #{therapist.sexual_id}, race: #{therapist.race}, age: #{therapist.age}"}
    end

    def print_therapist_names_matching_identity
        @therapists.map{|therapist| "name: #{therapist.chosen_name}"}
    end

    def find_therapists_in_my_location_who_take_my_insurance
        find_all_therapists.select{ |therapist| therapist.location == @current_user.location and therapist.insurance == @current_user.insurance}
    end

    def find_therapists_with_same_intersectional_id
        @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @current_user.gender_id and therapist.sexual_id == @current_user.sexual_id and therapist.race == @current_user.race}
    end

    def incorrect_selection
        clear_screen
        puts "Oops try again..."
        pause
        patient_home
    end

end
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
        puts "Hi #{@current_user.username}, you have #{@current_user.sessions.count} completed sessions"
        divider

        puts "Select from the choices below:"
        puts "1) Find a Therapist"
        puts "2) Manage Appointments"
        puts "\n~~ (Q)uit or (R)estart ~~"
        
        choice = get_user_input.upcase
    
        case choice
        when "1"
            clear_screen
            puts '*' * 30

            puts 'Here is a list of all therapists in your location that take your insurance:'
            puts print_therapist_names_insurance_and_location
            puts '*' * 30

            puts 'How would you like to find a therapist??'
            puts 'M) Find someone who has the exact same identities'
            puts 'C) Find someone with custom identities'
    

            #puts 'How would you like to narrow your search?'
            #puts 'GI) Gender Identity'
            #puts 'SI) Sexual Identity'
            #puts 'SB) Sex at Birth'
            #puts 'R) Race'
            #puts 'A) Age'
            #puts 'E) Education'
            #puts 'C) Certifications'

            search_choice = get_user_input.upcase

            case search_choice
            when 'M'
                puts 'Here are the therapists who have the same identities as you'
                puts print_therapist_names_matching_identity
            when 'C'
                puts 'What gender identity would you like in a therapist?'
                puts 'Woman'
                puts 'Man'
                puts 'Non-Binary'
                #puts 'No preference'
                gender_identity_preference = get_user_input.upcase

                puts 'What sexual identity would you like in a therapist?'
                puts 'Straight'
                puts 'Gay'
                puts 'Bisexual'
                puts 'Lesbian'
                puts 'Asexual'
                puts 'Pansexual'
                puts 'No preference'
                sexual_identity_preference = get_user_input.upcase

                puts 'What race would you like in a therapist?'
                puts 'White'
                puts 'Black'
                puts 'Asian'
                puts 'Latino'
                puts 'Native American'
                puts 'No preference'
                race_preference = get_user_input.upcase

                therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == gender_identity_preference and therapist.sexual_id == sexual_identity_preference and therapist.race == race_preference}
                therapists.map{|therapist| "name: #{therapist.chosen_name}, gender identity: #{therapist.gender_id}, sexual identity: #{therapist.sexual_id}, race: #{therapist.race}, age: #{therapist.age}"}

            else
                incorrect_selection
            end

        when "2"
          #playing_now
        when "R" || "RESTART"
          run
        when "Q" || "QUIT"
        else
          incorrect_selection
        end
    end

    def find_therapist(gender_search_choice)
        find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id = gender_search_choice}
    end

    def find_all_therapists
        Therapist.all
    end

    def print_therapist_names_insurance_and_location
        therapists = find_therapists_in_my_location_who_take_my_insurance
        therapists.map{|therapist| "name: #{therapist.chosen_name}, gender identity: #{therapist.gender_id}, sexual identity: #{therapist.sexual_id}, race: #{therapist.race}, age: #{therapist.age}"}
    end

    def print_therapist_names_matching_identity
        therapists = find_therapists_with_same_intersectional_id
        therapists.map{|therapist| "name: #{therapist.chosen_name}"}
    end

    def find_therapists_in_my_location_who_take_my_insurance
        find_all_therapists.select{ |therapist| therapist.location == @current_user.location and therapist.insurance == @current_user.insurance}
    end

    def find_therapists_with_same_intersectional_id
        find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @current_user.gender_id and therapist.sexual_id == @current_user.sexual_id and therapist.race == @current_user.race}
    end

    def incorrect_selection
        clear_screen
        puts "Oops try again..."
        pause
        home
    end

end
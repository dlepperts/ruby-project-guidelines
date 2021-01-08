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

            search_choice = get_user_input.upcase

            puts '*' * 30

            case search_choice
            when 'M'
                puts 'Here are the therapists who have the same identities as you'
                puts print_therapist_names_matching_identity
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
                            puts @therapists.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual identity: #{therapist.sexual_id}, Race: #{therapist.race}, Age: #{therapist.age}"}
                        when 'N'
                            @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @gender_identity_preference and therapist.sexual_id == @sexual_identity_preference}
                            puts @therapists.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual identity: #{therapist.sexual_id}, Race: #{therapist.race}, Age: #{therapist.age}"}
                        end
                     when 'N'
                        do_you_have_a_race_preference?
                        race_choice = get_user_input.upcase
                        case race_choice
                        when 'Y'
                            get_race_preference
                            @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @gender_identity_preference and therapist.race == @race_preference}
                            puts @therapists.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual identity: #{therapist.sexual_id}, Race: #{therapist.race}, Age: #{therapist.age}"}
                        when 'N'
                            @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.gender_id == @gender_identity_preference}
                            puts @therapists.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual identity: #{therapist.sexual_id}, Race: #{therapist.race}, Age: #{therapist.age}"}
                        end
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
                            puts @therapists.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual identity: #{therapist.sexual_id}, Race: #{therapist.race}, Age: #{therapist.age}"}
                        when 'N'
                            @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.sexual_id == @sexual_identity_preference}
                            puts @therapists.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual identity: #{therapist.sexual_id}, Race: #{therapist.race}, Age: #{therapist.age}"}
                        end

                    when 'N'
                        do_you_have_a_race_preference?
                        race_choice = get_user_input.upcase
                        case race_choice
                        when 'Y'
                            get_race_preference
                            @therapists = find_therapists_in_my_location_who_take_my_insurance.select{|therapist| therapist.race == @race_preference}
                            puts @therapists.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual identity: #{therapist.sexual_id}, Race: #{therapist.race}, Age: #{therapist.age}"}
                        when 'N'
                            puts print_therapist_names_insurance_and_location
                        end
                    end
                else
                    incorrect_selection
                end
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


    def find_all_therapists
        Therapist.all
    end

    def print_therapist_names_insurance_and_location
        therapists = find_therapists_in_my_location_who_take_my_insurance
        therapists.map{|therapist| "Name: #{therapist.chosen_name}, Gender Identity: #{therapist.gender_id}, Sexual Identity: #{therapist.sexual_id}, race: #{therapist.race}, age: #{therapist.age}"}
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
        patient_home
    end

end
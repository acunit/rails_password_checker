class PasswordController < ApplicationController
  def check_password
    @user_name = params[:user]
    @password = params[:pass]

    # Checks to see if username and password are the same
    def same(user, pass)
      if  user == pass
        false
      else
        true
      end
    end

    # Checks to see if the username and password and long enough
    def long_enough(user, pass)
      if user.length >= 6 && pass.length >= 6
        true
      else
        false
      end
    end

    # Checks to make sure the username does not include special characters or spaces
    def dncs(user)
      if (user.include? "!") || (user.include? "#") || (user.include? "$") || (user.include? " ")
        false
      else
        true
      end
    end

    # Checks to ensure that the password does not include the word 'password' and ensures it contains at least 1 special character.
    def cs(pass)
      if (pass.include? "password") || (pass.include? "PASSWORD") || (pass.include? "Password")
        false
      elsif (pass.include? "!") || (pass.include? "#") || (pass.include? "$")
        true
      else
        false
      end
    end

    # Checks to ensure the password contains at least 1 digit.
    def pwdigit(pass)
      if (pass.include? "0") || (pass.include? "1") || (pass.include? "2") || (pass.include? "3") || (pass.include? "4") || (pass.include? "5") || (pass.include? "6") || (pass.include? "7") || (pass.include? "8") || (pass.include? "9")
        true
      else
        false
      end
    end

    # Checks the password to ensure there is at least 1 upper and 1 lower case letter
    def hi_low_case(pass)
      if pass == pass.upcase || pass == pass.downcase
        false
      else
        true
      end
    end

    # Checks the user ID and password and returns true is all conditions are met and false if either is invalid.
    def cred_check(id, pw)
      if (same(id,pw) == true) && (long_enough(id, pw) == true) && (dncs(id) == true) && (cs(pw) == true) && (pwdigit(pw) == true) && (hi_low_case(pw) == true)
        true
      else
        false
      end
    end

    # Method to evaluate if the user ID and password combination is valid or invalid.
    # def validate_password
      # puts "Enter username"
      # user_name = gets.chomp
      # puts "Enter password"
      # user_pw = gets.chomp
      @credentials = cred_check(@user_name, @password)
      if (@user_name == nil) && (@password == nil) && (@credentials == false)
        @cred_string = ""
      elsif @credentials == true
        # puts "your credentials are valid."
        @cred_string = "Valid"
      else
        # puts "your credentials are invalid. Please try again."
        @cred_string = "Invalid"
      end
    # end

    # render "check_password.html.erb"
  end
end

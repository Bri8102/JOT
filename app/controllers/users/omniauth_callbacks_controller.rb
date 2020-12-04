class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
    def google_oauth2
      @user = User.from_omniauth(auth)
      if @user.persisted?
        sign_in_and_redirect @user
      else
        redirect_to new_user_registration_path
      end       
    end

    # def omniauth
    #   # binding.pry
    #   @user = User.from_omniauth(auth)
    #   # binding.pry
    #   @user.save
    #   # binding.pry
    #   session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    # end

    private

    def auth
      request.env["omniauth.auth"]
    end
  end
class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    # def after_sign_in_path_for(resource)
    #     request.env['omniauth.origin'] || root_path
    # end

    def google
        @user = User.from_omniauth(request.env["omniauth.env"])
        sign_in_and_redirect @user
    end

    # def current_user
    #     #If current user is null, set it their session to user_id otherwise keep the current value
    #     @user ||= User.find_by(id: session[:user_id])
    # end
end

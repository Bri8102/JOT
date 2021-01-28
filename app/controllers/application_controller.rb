class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    # def after_sign_in_path_for(resource)
    #     request.env['omniauth.origin'] || root_path
    # end


    def google
        @user = User.from_omniauth(request.env["omniauth.env"])
        sign_in_and_redirect @user
    end

    protected

    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password)}
         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password)}
    end

    # def current_user
    #     #If current user is null, set it their session to user_id otherwise keep the current value
    #     @user ||= User.find_by(id: session[:user_id])
    # end
end

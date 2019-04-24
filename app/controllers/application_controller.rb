class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        if current_user.admin?
            admin_top_path
        else
            posts_path
        end
    end

    def after_sign_out_path_for(resource)
        root_path
    end

    #管理者判定
    def authenticate_admin
        unless user_signed_in?
            redirect_to root_path
        else
            unless current_user.admin?
                redirect_to posts_path
            end
        end
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
end

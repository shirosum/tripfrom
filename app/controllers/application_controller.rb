class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path(resource)
        if current_user.admin?
            admin_top_path
        else
            posts_path
        end
    end

    def after_sign_out_path(resource)
        root_path
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    end
end

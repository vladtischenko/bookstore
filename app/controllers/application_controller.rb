class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected
    def after_sign_in_path_for(resource)
      if session[:order_items]
        session[:order_items].each do |order_item_id|
          current_user.current_order.order_items << OrderItem.find(order_item_id)
        end
        if current_user.try(:is_admin?)
          admin_root_path
        else
          user_orders_cart_path(current_user)
        end
      else
        root_path
      end
    end

    def configure_permitted_parameters
      # devise_parameter_sanitizer.for(:sign_up) do |u|
      #   u.permit(:email, :firstname, :lastname, :password, :password_confirmation)
      # end

      registration_params = [:firstname, :lastname, :email, :password, :password_confirmation]

      if params[:action] == 'update'
        devise_parameter_sanitizer.for(:account_update) { 
          |u| u.permit(registration_params << :current_password)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) { 
          |u| u.permit(registration_params)
        }
      end
    end

  private
    def session_current_user
      @_current_user ||= session[:current_user_id]# &&
        #User.find_by(id: session[:current_user_id])
    end
end

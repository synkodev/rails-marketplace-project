class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_cart
  before_action :load_cart

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name personal_id birth_date gender phone_number address terms_conditions photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name personal_id birth_date gender phone_number address terms_conditions photo])
  end

  # Se o carrinho tiver itens, mantém os itens que tem. Se não tiver, instancia um Array vazio.
  def initialize_cart
    session[:cart] ||= []
  end

  # Carrega do Model de Product a instância relativa a cada id dentro do carrinho
  def load_cart
    @cart = Product.find(session[:cart])
  end
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :birthday, :first_name_kanji, :last_name_kanji, :first_name_katakana, :last_name_katakana]
    )
  end
 end
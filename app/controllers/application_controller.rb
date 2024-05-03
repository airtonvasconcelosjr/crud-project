# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protected

  # Método para redirecionar o usuário após o login
  def after_sign_in_path_for(_resource)
    mattresses_path
  end

  # Método para redirecionar o usuário após o logout
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end

# spec/features/user_authentication_spec.rb
require 'rails_helper'

RSpec.feature "UserAuthentication", type: :feature do
  scenario "Unauthenticated user tries to access proponentes index" do
    # Tenta acessar a página index de proponentes
    visit proponentes_path

    # Verifica se está na página de login
    expect(current_path).to eq(new_user_session_path)

    # Confirma se há elementos esperados na página de login
    expect(page).to have_content("Log in")
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
  end
end

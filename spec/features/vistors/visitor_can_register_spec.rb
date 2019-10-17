# frozen_string_literal: true

require 'rails_helper'

describe 'vister can create an account', :js do
  it ' visits the home page' do
    email = 'jimbob@aol.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'
    password_confirmation = 'password'

    visit '/'

    click_on 'Sign In'

    expect(page).to have_current_path(login_path, ignore_query: true)

    click_on 'Sign up now.'

    expect(page).to have_current_path(new_user_path, ignore_query: true)

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    expect(page).to have_current_path(dashboard_path, ignore_query: true)

    expect(page).to have_content(email)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).not_to have_content('Sign In')

    expect(page).to have_content("Logged in as #{first_name}")
    expect(page).to have_content("This account has not yet been activated. Please check your email")
  end

  it 'visitor cannot create account with no email' do
    user = create(:user)

    visit login_path

    fill_in'session[email]', with: user.email
    fill_in'session[password]', with: user.password

    click_on 'Log In'

    click_on 'Profile'

    expect(page).to have_current_path(dashboard_path, ignore_query: true)

    click_on 'Log Out'

    email = user.email
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'
    password_confirmation = 'password'

    visit '/'

    click_on 'Sign In'

    expect(page).to have_current_path(login_path, ignore_query: true)

    click_on 'Sign up now.'

    expect(page).to have_current_path(new_user_path, ignore_query: true)

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    expect(page).to have_content("Username already exists")
  end
end

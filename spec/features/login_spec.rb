require 'rails_helper'

describe 'logging in' do

  scenario 'log in fails with invalid credentials' do
    User.create(:user_name => 'bob', :password => '123', :about => 'ugh')
    visit '/signin'
    fill_in :user_name, :with => 'test'
    fill_in :password, :with => '12'
    click_on 'Log In'

    expect(page).to have_content('Username/password invalid')
  end

  scenario 'log in succeeds with valid credentials' do
    User.create(:user_name => 'bob', :password => '123', :about => 'ugh')
    visit '/signin'
    fill_in :user_name, :with => 'bob'
    fill_in :password, :with => '123'
    click_on 'Log In'

    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('bob')
  end
end

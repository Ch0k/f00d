require 'rails_helper'

feature 'User can sign out', %q{
  Authorized user can log out
} do

  given(:user) { create(:user) }
  scenario 'User click to sign out' do 
    
    visit new_user_session_path 
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    visit store_index_url
    click_on 'Log_out'
    expect(page).to have_content 'Signed out successfully.'
  end
end

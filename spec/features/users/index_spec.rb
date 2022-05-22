require 'rails_helper'

feature 'User can see all users', %q{
  the user can look at all users to find a similar product   
} do

  given!(:users) { create_list(:user, 3) }

  scenario 'User see all users in users url' do
    visit users_path
    users.each do |user|
      expect(page).to have_content user.phone
    end
  end
end


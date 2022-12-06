# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
require 'rails_helper'

RSpec.describe 'Author Creation' do
    it 'When clicking the New Author link from /authors, user is directed to /authors/new' do
        visit "/authors"

        click_link "New Author"
        

        expect(current_path).to eq("/authors/new")
    end

    it 'Creates and stores a new author after submitting filled out form' do
        visit "authors/new"
        fill_in('Name', with: 'Charles Bukowski')
        fill_in('Rating', with: '8')
        click_button('Create Author')

        expect(current_path).to eq("/authors")
        expect(page).to have_content("Charles Bukowski")
    end

end
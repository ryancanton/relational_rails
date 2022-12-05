# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'Updating Authors' do
    it 'Will take user to authors/:id/edit when clicking link Update Author' do
        author = Author.create!(name: 'Charles Bukowski', rating: 8, alive: false)

        visit "authors/#{author.id}"
        click_button "Update Author"

        expect(current_path).to eq("/authors/#{author.id}/edit")
    end

    it 'Will update the author and return to show page' do
        author = Author.create!(name: 'Charls Bukowski', rating: 8, alive: false)

        visit "authors/#{author.id}/edit"

        fill_in('Name', with: 'Charles Bukowski')
        fill_in('Rating', with: '8')
        click_button('Update Author')

        expect(current_path).to eq("/authors/#{author.id}")
        expect(page).to have_content("Charles Bukowski")
    end
end
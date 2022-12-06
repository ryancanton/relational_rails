# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe 'Deleting an author' do
    it 'the show page contains a link that deletes the parent and all children' do
        author = Author.create!(name: "Stephen King", rating: 7, alive: true)
        book_1 = author.books.create!(name: "It", pages: 1011, fiction: true)
        book_2 = author.books.create!(name: "The Shining", pages: 607, fiction: true)
        visit "/authors/#{author.id}"
        click_link "Delete Author"

        expect(current_path).to eq("/authors")
        expect(page).to_not have_content("Stephen King")

        visit "/books"
        expect(page).to_not have_content("It")
        expect(page).to_not have_content("The Shining")
    end
end
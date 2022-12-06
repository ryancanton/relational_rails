# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
require 'rails_helper'

RSpec.describe 'Deleting a Book' do
    it 'book show page contains a link to delete the book and redirects to /books' do
        author = Author.create!(name: "Stephen King", rating: 7, alive: true)
        book = author.books.create!(name: "It", pages: 1011, fiction: true)

        visit "/books/#{book.id}"
        click_link "Delete Book"

        expect(current_path).to eq("/books")
        expect(page).to_not have_content("It")
    end

end
require 'rails_helper'

RSpec.describe 'Index Page of Authors' do
    it 'displays the names of all authors' do 
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        author_2 = Author.create!(name: "Vladmir Nabokov", rating: 10, alive: false)
        book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
        visit "/authors"

        expect(page).to have_content(author_1.name)
        expect(page).to have_content(author_2.name)
        expect(page).to_not have_content(book_1.name)
    end
end
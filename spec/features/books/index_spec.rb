require 'rails_helper'

RSpec.describe 'The Books Index Page' do
    it 'When I visit /books I see each book in the system including the books attributes' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        author_2 = Author.create!(name: "Vladmir Nabokov", rating: 10, alive: false)
        book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
        book_2 = author_2.books.create!(name: "Pale Fire", pages: 355, fiction: true)
        visit "/books"
        
        expect(page).to have_content(book_1.name)
        expect(page).to have_content(book_1.pages)
        expect(page).to have_content(book_1.fiction)
        expect(page).to have_content(book_2.name)
        expect(page).to have_content(book_2.pages)
        expect(page).to have_content(book_2.fiction)
    end

    it 'has a header and return to home link' do
        visit "/books"
        
        expect(page).to have_content("All Books")
        expect(page).to have_content("Back to Home")
    end
end
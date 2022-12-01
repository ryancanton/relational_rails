require 'rails_helper'

RSpec.describe 'The Book Show Page' do
    it 'When I visit /books/:id I see the book with that id including the books attributes' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
        book_2 = author_1.books.create!(name: "The Shining", pages: 607, fiction: true)
        visit "/books/#{book_1.id}"

        expect(page).to have_content(book_1.name)
        expect(page).to have_content(book_1.pages)
        expect(page).to have_content(book_1.fiction)
        expect(page).to_not have_content(book_2.name)
        expect(page).to_not have_content(book_2.pages)
    end

    it 'has a link to the books page' do
        visit "/"
        click_on("Book Index")

        expect(current_path).to eq("/books")
    end

    it 'has a link to the authors page' do
        visit "/"
        click_on("Author Index")

        expect(current_path).to eq("/authors")
    end
end
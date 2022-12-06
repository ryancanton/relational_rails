require 'rails_helper'

RSpec.describe 'The author books page' do
    it 'When I visit /authors/:id/books I see each book that is associated with that author with each books attributes' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        author_2 = Author.create!(name: "Vladmir Nabokov", rating: 10, alive: false)
        book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
        book_2 = author_1.books.create!(name: "The Shining", pages: 607, fiction: true)
        book_3 = author_1.books.create!(name: "Pale Fire", pages: 355, fiction: true)
        visit "/authors/#{author_1.id}/books"

        expect(page).to have_content(author_1.name)
        expect(page).to have_content(book_1.name)
        expect(page).to have_content(book_1.pages)
        expect(page).to have_content(book_1.fiction)
        expect(page).to have_content(book_2.name)
        expect(page).to have_content(book_2.pages)
        expect(page).to have_content(book_2.fiction)
    end

    it 'contains a link that will order list of authors books by alphabetical order' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        book_1 = author_1.books.create!(name: "The Shining", pages: 607, fiction: true)
        book_2 = author_1.books.create!(name: "Carrie", pages: 244, fiction: true)
        book_3 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
        visit "/authors/#{author_1.id}/books"
        click_link "Alphabetize Book List"

        expect(current_path).to eq("/authors/#{author_1.id}/books")
        expect(page).to have_content("Carrie\nPages: 244\nFiction?: true\nIt\nPages: 1011\nFiction?: true\nThe Shining\nPages: 607\nFiction?: true")
    end

    it 'has a link to the books page' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        visit "/authors/#{author_1.id}/books"
        click_on("Book Index")

        expect(current_path).to eq("/books")
    end

    it 'has a link to the authors page' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        visit "/authors/#{author_1.id}/books"
        click_on("Author Index")

        expect(current_path).to eq("/authors")
    end
end
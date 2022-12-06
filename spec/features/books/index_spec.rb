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

    it 'each author has a link that leads to that authors edit page' do
        author_1 = Author.create!(name: 'Stephen King', rating: 7, alive: true)
        book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
        book_2 = author_1.books.create!(name: "Different Seasons", pages: 355, fiction: true)
        visit "/books" 
        click_link "Edit It"

        expect(current_path).to eq("/books/#{book_1.id}/edit")
    end

    it 'I only see records where the boolean column is `true`' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        author_2 = Author.create!(name: "Vladmir Nabokov", rating: 10, alive: false)
        book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
        book_2 = author_2.books.create!(name: "Pale Fire", pages: 355, fiction: true)
        book_3 = author_1.books.create!(name: "How to be a Writer", pages: 501, fiction: false)
        visit "/books"

        expect(page).to have_content(book_1.name)
        expect(page).to have_content(book_1.pages)
        expect(page).to have_content(book_1.fiction)
        expect(page).to have_content(book_2.name)
        expect(page).to have_content(book_2.pages)
        expect(page).to have_content(book_2.fiction)
        expect(page).to_not have_content(book_3.name)
        expect(page).to_not have_content(book_3.pages)
        expect(page).to_not have_content(book_3.fiction)
    end

    it 'has a header' do
        visit "/books"
        
        expect(page).to have_content("All Books")
    end

    it 'has a link to the authors page' do
        visit "/books"
        click_on("Author Index")

        expect(current_path).to eq("/authors")
    end
end
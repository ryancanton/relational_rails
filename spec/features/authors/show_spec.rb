require 'rails_helper'

RSpec.describe 'The Author show page' do
    it 'When I visit /authors/:id I see the author with that id including the attributes' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        author_2 = Author.create!(name: "Vladmir Nabokov", rating: 10, alive: false)
        visit "/authors/#{author_1.id}"

        expect(page).to have_content(author_1.name)
        expect(page).to have_content(author_1.rating)
        expect(page).to have_content(author_1.alive)
        expect(page).to_not have_content(author_2.name)
        expect(page).to_not have_content(author_2.rating)
        expect(page).to_not have_content(author_2.alive)
    end

    it 'shows the count of chilrden' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
        book_2 = author_1.books.create!(name: "The Shining", pages: 614, fiction: true)
        book_2 = author_1.books.create!(name: "Carrie", pages: 304, fiction: true)
        visit "/authors/#{author_1.id}"

        expect(page).to have_content("Author Book Count: #{author_1.book_count}")
    end

    it 'has a link to the books page' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        visit "/authors/#{author_1.id}"
        click_on("Book Index")

        expect(current_path).to eq("/books")
    end

    it 'has a link to the authors page' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        visit "/authors/#{author_1.id}"
        click_on("Author Index")

        expect(current_path).to eq("/authors")
    end

    it 'has a link to the authors books page' do
        author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
        visit "/authors/#{author_1.id}"
        click_on("Books By Author")

        expect(current_path).to eq("/authors/#{author_1.id}/books")
    end
end
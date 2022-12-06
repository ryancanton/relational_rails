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

    it 'displays header' do
        visit "/authors"

        expect(page).to have_content("All Authors")
    end

    it 'orders authors by by most recently created first and displays when each author is created' do
        author_1 = Author.create!(name: 'Stephen King', rating: 7, alive: true)
        author_2 = Author.create!(name: 'Vladmir Nabokov', rating: 10, alive: false)  
        author_3 = Author.create!(name: 'Mark Twain', rating: 9, alive: false)  
        visit "/authors" 
        
        expect(page).to have_content("Mark Twain\nCreated At: #{author_3.created_at}\nEdit Mark Twain Delete Mark Twain\nVladmir Nabokov\nCreated At: #{author_2.created_at}\nEdit Vladmir Nabokov Delete Vladmir Nabokov\nStephen King\nCreated At: #{author_1.created_at}")
    end

    it 'each author has a link that leads to that authors edit page' do
        author_1 = Author.create!(name: 'Stephen King', rating: 7, alive: true)
        author_2 = Author.create!(name: 'Vladmir Nabokov', rating: 10, alive: false)  
        author_3 = Author.create!(name: 'Mark Twain', rating: 9, alive: false)  
        visit "/authors" 
        click_link "Edit Stephen King"

        expect(current_path).to eq("/authors/#{author_1.id}/edit")
    end

    it 'each author has a link that deletes that author' do
        author_1 = Author.create!(name: 'Stephen King', rating: 7, alive: true)
        author_2 = Author.create!(name: 'Vladmir Nabokov', rating: 10, alive: false)  
        author_3 = Author.create!(name: 'Mark Twain', rating: 9, alive: false)  
        visit "/authors" 
        click_link "Delete Stephen King"

        expect(current_path).to eq("/authors")
        expect(page).to_not have_content("Stephen King")
    end

    it 'has a link to the books page' do
        visit "/authors"
        click_on("Book Index")

        expect(current_path).to eq("/books")
    end
end
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

    it 'displays header and link back to home page' do
        visit "/authors"

        expect(page).to have_content("All Authors")
        expect(page).to have_content("Back to Home")
    end

    it 'orders authors by by most recently created first and displays when each author is created' do
        author_1 = Author.create!(name: 'Stephen King', rating: 7, alive: true)
        author_2 = Author.create!(name: 'Vladmir Nabokov', rating: 10, alive: false)  
        author_3 = Author.create!(name: 'Mark Twain', rating: 9, alive: false)  
        visit "/authors" 
        
        expect(page).to have_content("Mark Twain\nCreated At: #{author_3.created_at}\nVladmir Nabokov\nCreated At: #{author_2.created_at}\nStephen King\nCreated At: #{author_1.created_at}")
    end
end
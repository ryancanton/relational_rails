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
end
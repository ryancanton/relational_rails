# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'Creating a new book' do
    it 'the authors/:id/books page has a link to create a new book that leads to authors/:id/books/new' do
        author = Author.create!(name: 'Vladmir Nabokov', rating: 10, alive: false)

        visit "authors/#{author.id}/books"
        click_link "Create Book"

        expect(current_path).to eq("/authors/#{author.id}/books/new")
    end

    it 'Can create a new book and redirect to authors/:id/books page' do
        author = Author.create!(name: 'Vladmir Nabokov', rating: 10, alive: false)

        visit "/authors/#{author.id}/books/new"
        fill_in('Name', with: 'Pale Fire')
        fill_in('Pages', with: '344')
        check('Fiction')
        click_button('Create Book')

        expect(current_path).to eq("/authors/#{author.id}/books")
        expect(page).to have_content("Pale Fire")
    end

end
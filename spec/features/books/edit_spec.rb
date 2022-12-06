# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'

RSpec.describe 'Editing books' do
    it 'the books show page has a link to books/:id/edit' do
        author = Author.create!(name: 'Vladmir Nabokov', rating: 10, alive: false)
        book = author.books.create(name: 'Pale Fire', pages: 344, fiction: true)

        visit "/books/#{book.id}"
        click_link "Update Book"

        expect(current_path).to eq("/books/#{book.id}/edit")
    end

    it 'a book can be edited, and the edits are shown on the books show page' do
        author = Author.create!(name: 'Vladmir Nabokov', rating: 10, alive: false)
        book = author.books.create(name: 'Pale Fir', pages: 344, fiction: true)

        visit "/books/#{book.id}/edit"
        fill_in('Name', with: 'Pale Fire')
        fill_in('Pages', with: '344')
        check('Fiction')
        click_button('Update Book')

        expect(current_path).to eq("/books/#{book.id}")
        expect(page).to have_content("Pale Fire")
    end
end
require 'rails_helper'

RSpec.describe 'The Welcome page' do
    it 'displays welcome header and links to (new)books and (new)authors' do
        visit "/"
        expect(page).to have_content("Welcome to the Book and Author Manager")
        expect(page).to have_content("Book Index")
        expect(page).to have_content("New Book")
        expect(page).to have_content("Author Index")
        expect(page).to have_content("New Author")
    end
end
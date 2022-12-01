require 'rails_helper'

RSpec.describe Author do
    it {should have_many :books}

    describe '#book_count' do
        it 'returns count of books associated with author' do
            author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
            book_1 = author.books.create!(name: "It", pages: 1011, ficiton: true)
            book_2 = author.books.create!(name: "The Shining", pages: 614, ficiton: true)
            book_2 = author.books.create!(name: "Carrie", pages: 304, ficiton: true)

            expect(author_1.book_count).to eq(3)
        end
    end
end
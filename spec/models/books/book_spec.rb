require 'rails_helper'

RSpec.describe Book do
    it {should belong_to :author}

    describe '#self.alphabetize' do
        it 'alphabetizes and returns books by a given author' do
            author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
            book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
            book_2 = author_1.books.create!(name: "The Shining", pages: 614, fiction: true)
            book_3 = author_1.books.create!(name: "Carrie", pages: 304, fiction: true)
            author_2 = Author.create!(name: "Hegel", rating: 9, alive: false)
            book_4 = author_2.books.create!(name: "Reason in History", pages: 356, fiction: false)

            expect(Book.alphabetize(author_1.id)).to eq([book_3, book_1, book_2])
        end
    end

    describe '#self.above_threshold' do
        it 'returns all books by a given author with a page number higher than the given threshold' do
            author_1 = Author.create!(name: "Stephen King", rating: 7, alive: true)
            book_1 = author_1.books.create!(name: "It", pages: 1011, fiction: true)
            book_2 = author_1.books.create!(name: "The Shining", pages: 614, fiction: true)
            book_3 = author_1.books.create!(name: "Carrie", pages: 304, fiction: true)

            expect(Book.above_threshold(500, author_1.id)).to eq([book_1, book_2])
        end
    end
end
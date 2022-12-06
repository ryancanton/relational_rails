
class Book < ApplicationRecord
    belongs_to :author

    def self.alphabetize(author_id)
        Book.where(author_id: author_id).order(name: :asc)
    end

    def self.above_threshold(threshold, author_id)
        Book.where("pages > ? AND author_id = ?", threshold, author_id)
    end
end
class Book < ApplicationRecord
    # resourcify << Only used if using scoped roles
    belongs_to :author
    has_many :book_genres
    has_many :genres, through: :book_genres

    has_one_attached :cover

    validates :title, presence: true, length: {in:2..100}
end

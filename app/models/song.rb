class Song < ApplicationRecord

    validates :title, presence: true
    validates :release_year, presence: true, if: -> {released == true}
    validates :title && :release_year, uniqueness: true
    validates :artist_name, presence: true
    validate :past?, if: -> {released == true}

    def past?
        if self.release_year && self.release_year > Date.today.year
            errors.add(:release_year, " can't be in the future")
        end
    end

end

